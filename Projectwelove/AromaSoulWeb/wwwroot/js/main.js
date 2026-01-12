const herbs = [
    { id: 1, name: 'Peppermint', type: 'energized', icon: '🌿', benefits: 'Cooling, Focus', color: '#81C784' },
    { id: 2, name: 'Lavender', type: 'relaxed', icon: '🌸', benefits: 'Calming, Sleep', color: '#9FA8DA' },
    { id: 3, name: 'Eucalyptus', type: 'relief', icon: '🍃', benefits: 'Sinus Relief', color: '#4DB6AC' },
    { id: 4, name: 'Bergamot', type: 'energized', icon: '🍋', benefits: 'Uplifting', color: '#FFF59D' },
    { id: 5, name: 'Chamomile', type: 'relaxed', icon: '🌼', benefits: 'Soothing', color: '#FFE082' },
    { id: 6, name: 'Lemongrass', type: 'relief', icon: '🌱', benefits: 'Refresh, Pain', color: '#CDCDC0' },
    { id: 7, name: 'Rosemary', type: 'energized', icon: '🌲', benefits: 'Memory', color: '#A5D6A7' },
    { id: 8, name: 'Clove', type: 'relief', icon: '🌰', benefits: 'Warming', color: '#D7CCC8' },
];

let selectedHerbs = [];
let cart = JSON.parse(localStorage.getItem('cart')) || [];
const MAX_SELECTION = 3;

// DOM Elements
const herbGrid = document.getElementById('herbGrid');
const blendList = document.getElementById('blendList');
const addToCartBtn = document.getElementById('addToCart');
const filterBtns = document.querySelectorAll('.filter-btn');
const inhalerBody = document.getElementById('inhalerBody');

// Cart Elements
const cartToggle = document.getElementById('cartToggle');
const cartOverlay = document.getElementById('cartOverlay');
const cartBackdrop = document.getElementById('cartBackdrop');
const closeCartBtn = document.getElementById('closeCart');
const cartItemsContainer = document.getElementById('cartItems');
const cartCount = document.getElementById('cartCount');
const cartTotal = document.getElementById('cartTotal');

// Initialize
document.addEventListener('DOMContentLoaded', () => {
    renderHerbs('all');
    setupFilters();

    // Cart Interaction
    cartToggle.addEventListener('click', toggleCart);
    closeCartBtn.addEventListener('click', toggleCart);
    cartBackdrop.addEventListener('click', toggleCart);

    addToCartBtn.addEventListener('click', addItemToCart);
    document.querySelector('.checkout-btn').addEventListener('click', () => {
        // Simple routing check
        window.location.href = '/Checkout';
    });
    updateCartUI();
});

function toggleCart() {
    cartOverlay.classList.toggle('active');
    cartBackdrop.classList.toggle('active');
}

function addItemToCart() {
    if (selectedHerbs.length === 0) return;

    const nameInput = document.getElementById('blendName');
    const customName = nameInput.value.trim() || 'Custom Blend';

    const blendItem = {
        id: Date.now(), // Unique ID
        name: customName,
        herbs: [...selectedHerbs],
        price: 12.00
    };

    // Reset input
    nameInput.value = '';

    cart.push(blendItem);
    saveCart();
    updateCartUI();
    toggleCart(); // Open cart to show item

    // Optional: clear selection after adding
    // selectedHerbs = [];
    // updateBlendSummary();
    // updateInhalerVisuals();
    // document.querySelectorAll('.herb-card').forEach(c => c.classList.remove('selected'));
}

function updateCartUI() {
    cartCount.textContent = cart.length;

    if (cart.length === 0) {
        cartItemsContainer.innerHTML = '<div class="empty-cart-msg">Your cart is empty.</div>';
        cartTotal.textContent = '$0.00';
        return;
    }

    cartItemsContainer.innerHTML = '';
    let total = 0;

    cart.forEach(item => {
        total += item.price;
        const herbNames = item.herbs.map(h => h.name).join(', ');

        const itemEl = document.createElement('div');
        itemEl.className = 'cart-item';
        itemEl.innerHTML = `
            <div class="cart-item-info">
                <div class="cart-item-details">
                    <h4>${item.name}</h4>
                    <div class="cart-item-ingredients">${herbNames}</div>
                </div>
                <div class="cart-item-price">$${item.price.toFixed(2)}</div>
            </div>
            <button class="cart-remove-btn" onclick="removeItemFromCart(${item.id})">×</button>
        `;
        cartItemsContainer.appendChild(itemEl);
    });

    cartTotal.textContent = `$${total.toFixed(2)}`;
}

window.removeItemFromCart = function (id) {
    const index = cart.findIndex(item => item.id === id);
    if (index > -1) {
        cart.splice(index, 1);
        updateCartUI();
    }
}

function setupFilters() {
    filterBtns.forEach(btn => {
        btn.addEventListener('click', (e) => {
            // Remove active class from all
            filterBtns.forEach(b => b.classList.remove('active'));
            // Add to clicked
            e.target.classList.add('active');
            // Filter
            const filter = e.target.dataset.filter;
            renderHerbs(filter);
        });
    });
}

function renderHerbs(filter) {
    herbGrid.innerHTML = '';

    const filteredHerbs = filter === 'all'
        ? herbs
        : herbs.filter(h => h.type === filter);

    filteredHerbs.forEach(herb => {
        const isSelected = selectedHerbs.some(h => h.id === herb.id);
        const card = document.createElement('div');
        card.className = `herb-card ${isSelected ? 'selected' : ''}`;
        card.onclick = () => toggleHerb(herb);

        card.innerHTML = `
            <span class="herb-icon">${herb.icon}</span>
            <span class="herb-name">${herb.name}</span>
            <span class="herb-benefits">${herb.benefits}</span>
        `;
        herbGrid.appendChild(card);
    });
}

function toggleHerb(herb) {
    const index = selectedHerbs.findIndex(h => h.id === herb.id);

    if (index > -1) {
        // Remove
        selectedHerbs.splice(index, 1);
    } else {
        // Add
        if (selectedHerbs.length >= MAX_SELECTION) {
            alert(`You can only select up to ${MAX_SELECTION} herbs for your blend.`);
            return;
        }
        selectedHerbs.push(herb);
    }

    // Create simple animation effect
    renderHerbs(document.querySelector('.filter-btn.active').dataset.filter);
    updateBlendSummary();
    updateInhalerVisuals();
}

function updateInhalerVisuals() {
    // Clear current layers (keep empty text if needed, but easier to just rebuild)
    inhalerBody.innerHTML = '';

    if (selectedHerbs.length === 0) {
        inhalerBody.innerHTML = '<div class="inhaler-empty-text">Empty</div>';
        return;
    }

    const layerHeight = 100 / MAX_SELECTION; // Divide height evenly

    selectedHerbs.forEach(herb => {
        const layer = document.createElement('div');
        layer.className = 'herb-layer';
        layer.style.backgroundColor = herb.color;
        layer.style.height = `${layerHeight}%`;
        layer.title = herb.name;
        inhalerBody.appendChild(layer);
    });
}

function updateBlendSummary() {
    blendList.innerHTML = '';

    if (selectedHerbs.length === 0) {
        blendList.innerHTML = '<li class="empty-state">Select up to 3 herbs...</li>';
        addToCartBtn.disabled = true;
        addToCartBtn.textContent = 'Add to Cart - $12.00';
    } else {
        selectedHerbs.forEach(herb => {
            const li = document.createElement('li');
            li.innerHTML = `
                <span>${herb.name}</span>
                <span class="remove-herb" onclick="toggleHerbById(${herb.id})">×</span>
            `;
            blendList.appendChild(li);
        });

        addToCartBtn.disabled = false;
        // Simple price logic
        const basePrice = 12;
        const total = basePrice + (selectedHerbs.length * 2); // adding complexity adds cost? Just placeholder logic. 
        // Actually let's keep it flat price for simplicity or custom logic
        addToCartBtn.textContent = `Add Blend to Cart`;
    }
}

// Helper for the X button in summary
window.toggleHerbById = function (id) {
    const herb = herbs.find(h => h.id === id);
    if (herb) toggleHerb(herb);
}

function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}
