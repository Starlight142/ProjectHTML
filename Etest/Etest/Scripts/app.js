/**
 * Nexus CRUD Application Logic - SQL Server Connected
 * Communicates with ASP.NET Code-Behind WebMethods
 */

let inventory = [];
let editMode = false;

// DOM Elements
const inventoryBody = document.getElementById('inventoryBody');
const itemForm = document.getElementById('itemForm');
const itemModal = document.getElementById('itemModal');
const modalTitle = document.getElementById('modalTitle');
const totalCountEl = document.getElementById('totalCount');
const totalValueEl = document.getElementById('totalValue');
const lowStockCountEl = document.getElementById('lowStockCount');
const searchInput = document.getElementById('searchInput');
const emptyState = document.getElementById('emptyState');
const toast = document.getElementById('toast');

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    loadInventory();
    setupEventListeners();

    // System Boot Logic
    const initBtn = document.getElementById('initBtn');
    const bootOverlay = document.getElementById('bootOverlay');
    if (initBtn && bootOverlay) {
        initBtn.addEventListener('click', () => {
            bootOverlay.style.opacity = '0';
            setTimeout(() => bootOverlay.classList.add('hidden'), 500);
            console.log("System Initialized. Audio Unlocked.");
        });
    }
});

function setupEventListeners() {
    // Modal controls
    document.getElementById('openModalBtn').addEventListener('click', () => openModal());
    document.getElementById('closeModalBtn').addEventListener('click', closeModal);
    document.getElementById('cancelBtn').addEventListener('click', closeModal);
    document.getElementById('itemModal').addEventListener('click', (e) => {
        if (e.target === itemModal) closeModal();
    });

    // Form submission
    itemForm.addEventListener('submit', (e) => {
        e.preventDefault();
        saveItem();
    });

    // Search
    searchInput.addEventListener('input', (e) => {
        renderTable(e.target.value);
    });

    // Scoreboard State - Reset on reload
    localStorage.removeItem('nexus_catches');
    localStorage.removeItem('nexus_misses');
    let catches = 0;
    let misses = 0;

    let rewardTriggered = false;

    const updateScoreboardUI = () => {
        const scoreboardCard = document.getElementById('scoreboardCard');
        const catchesEl = document.getElementById('catchesCount');
        const missesEl = document.getElementById('missesCount');
        const isRunawayEnabled = localStorage.getItem('nexus_runaway_enabled') !== 'false';

        if (isRunawayEnabled) {
            scoreboardCard.classList.remove('hidden');
            catchesEl.textContent = catches;
            missesEl.textContent = misses;

            // Rickroll Reward - Trigger at exactly 10 misses and only once
            if (misses >= 10 && !rewardTriggered) {
                rewardTriggered = true;
                console.log("10 Misses reached! Displaying YouTube Overlay...");

                const overlay = document.getElementById('youtubeOverlay');
                const player = document.getElementById('ytPlayer');
                if (overlay && player) {
                    player.src = "https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1&mute=0&rel=0&enablejsapi=1";
                    overlay.classList.remove('hidden');
                    document.body.classList.add('overlay-active'); // Add class to body to optimize CSS
                }

                showToast("🏆 LEGENDARY STATUS ACHIEVED!");
            }
        } else {
            scoreboardCard.classList.add('hidden');
        }
    };

    updateScoreboardUI();

    // Run-away button behavior
    const runawayBtn = document.getElementById('openModalBtn');

    runawayBtn.addEventListener('mouseover', () => {
        const isRunawayEnabled = localStorage.getItem('nexus_runaway_enabled') !== 'false';

        if (isRunawayEnabled) {
            // Missed! (Hover triggered a runaway)
            misses++;
            localStorage.setItem('nexus_misses', misses);
            updateScoreboardUI();

            setTimeout(() => {
                const x = Math.random() * (window.innerWidth - runawayBtn.offsetWidth);
                const y = Math.random() * (window.innerHeight - runawayBtn.offsetHeight);

                runawayBtn.style.position = 'fixed';
                runawayBtn.style.zIndex = '9999';
                runawayBtn.style.left = `${x}px`;
                runawayBtn.style.top = `${y}px`;
                runawayBtn.style.transition = 'all 0.2s ease';
            }, 30);
        } else {
            runawayBtn.style.position = '';
            runawayBtn.style.left = '';
            runawayBtn.style.top = '';
        }
    });

    // Track catches
    runawayBtn.addEventListener('click', () => {
        const isRunawayEnabled = localStorage.getItem('nexus_runaway_enabled') !== 'false';
        if (isRunawayEnabled) {
            catches++;
            localStorage.setItem('nexus_catches', catches);
            updateScoreboardUI();
            showToast("WIN! You caught it!");
        }
    });

    // Track clicks on main content as misses (optional but fun)
    document.querySelector('.main-content').addEventListener('click', (e) => {
        const isRunawayEnabled = localStorage.getItem('nexus_runaway_enabled') !== 'false';
        if (isRunawayEnabled && e.target.closest('.main-content') && !e.target.closest('#openModalBtn')) {
            misses++;
            localStorage.setItem('nexus_misses', misses);
            updateScoreboardUI();
        }
    });
}

/**
 * AJAX Communication
 */

async function apiCall(method, data = {}) {
    try {
        const response = await fetch(`index.aspx/${method}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(data)
        });
        const result = await response.json();
        return result.d;
    } catch (error) {
        console.error(`API Error (${method}):`, error);
        showToast('Communication error with server.');
        return null;
    }
}

async function loadInventory() {
    const data = await apiCall('GetItems');
    if (data) {
        inventory = data;
        renderTable();
    }
}

async function saveItem() {
    const id = document.getElementById('itemId').value;
    const name = document.getElementById('itemName').value;
    const category = document.getElementById('itemCategory').value;
    const price = parseFloat(document.getElementById('itemPrice').value);
    const quantity = parseInt(document.getElementById('itemQuantity').value);

    let result;
    if (editMode) {
        result = await apiCall('UpdateItem', { id: parseInt(id), name, category, price, quantity });
    } else {
        result = await apiCall('AddItem', { name, category, price, quantity });
    }

    if (result === "Success") {
        showToast(editMode ? 'Item updated successfully!' : 'New item added!');
        closeModal();
        loadInventory();
    } else if (result) {
        showToast(result); // Show error message from server
    }
}

window.deleteItem = async function (id) {
    if (confirm('Are you sure you want to delete this item?')) {
        const result = await apiCall('DeleteItem', { id: parseInt(id) });
        if (result === "Success") {
            showToast('Item deleted.');
            loadInventory();
        } else if (result) {
            showToast(result);
        }
    }
};

window.editItem = function (id) {
    const item = inventory.find(i => i.id == id); // Use == for string/number comparison
    if (!item) return;

    editMode = true;
    modalTitle.textContent = 'Edit Item';
    document.getElementById('itemId').value = item.id;
    document.getElementById('itemName').value = item.name;
    document.getElementById('itemCategory').value = item.category;
    document.getElementById('itemPrice').value = item.price;
    document.getElementById('itemQuantity').value = item.quantity;

    openModal();
};

/**
 * UI Rendering
 */

function renderTable(filter = '') {
    inventoryBody.innerHTML = '';

    const filteredData = inventory.filter(item =>
        item.name.toLowerCase().includes(filter.toLowerCase()) ||
        item.category.toLowerCase().includes(filter.toLowerCase())
    );

    if (filteredData.length === 0) {
        emptyState.classList.remove('hidden');
    } else {
        emptyState.classList.add('hidden');
        filteredData.forEach(item => {
            const tr = document.createElement('tr');
            tr.className = 'fade-in';

            const statusClass = item.quantity <= 0 ? 'status-out' : (item.quantity < 5 ? 'status-low' : 'status-instock');
            const statusText = item.quantity <= 0 ? 'Out of Stock' : (item.quantity < 5 ? 'Low Stock' : 'In Stock');

            tr.innerHTML = `
                <td>
                    <div style="font-weight: 600;">${item.name}</div>
                    <div style="font-size: 0.75rem; color: var(--text-muted);">ID: ${item.id}</div>
                </td>
                <td><span class="badge" style="background: rgba(255,255,255,0.05)">${item.category}</span></td>
                <td>${item.quantity} units</td>
                <td>$${parseFloat(item.price).toLocaleString(undefined, { minimumFractionDigits: 2 })}</td>
                <td><span class="badge ${statusClass}">${statusText}</span></td>
                <td>
                    <div style="display: flex; gap: 8px;">
                        <button class="action-btn edit-btn" onclick="editItem('${item.id}')" title="Edit">
                            <i data-lucide="edit-3" style="width:16px; height:16px"></i>
                        </button>
                        <button class="action-btn delete-btn" onclick="deleteItem('${item.id}')" title="Delete">
                            <i data-lucide="trash-2" style="width:16px; height:16px"></i>
                        </button>
                    </div>
                </td>
            `;
            inventoryBody.appendChild(tr);
        });
    }

    updateStats();
    if (window.lucide) lucide.createIcons();
}

function openModal() {
    itemModal.classList.add('active');
}

function closeModal() {
    itemModal.classList.remove('active');
    itemForm.reset();
    document.getElementById('itemId').value = '';
    editMode = false;
    modalTitle.textContent = 'Add New Item';
}

function updateStats() {
    const totalCount = inventory.length;
    const totalValue = inventory.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const lowStockCount = inventory.filter(item => item.quantity < 5).length;

    totalCountEl.textContent = totalCount;
    totalValueEl.textContent = `$${totalValue.toLocaleString(undefined, { minimumFractionDigits: 2 })}`;
    lowStockCountEl.textContent = lowStockCount;
}

function showToast(message) {
    toast.textContent = message;
    toast.classList.add('show');
    setTimeout(() => {
        toast.classList.remove('show');
    }, 3000);
}
