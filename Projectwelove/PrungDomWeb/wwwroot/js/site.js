// State
let currentOrder = {
    vessel: { name: 'Obsidian Black', price: 0 },
    soul: null,
    scents: [],
    label: ''
};

const prices = {
    vessel: {
        'obsidian': { name: 'Obsidian Black', price: 0 },
        'gold': { name: 'Royal Gold', price: 50 },
        'pearl': { name: 'Pearl White', price: 20 }
    },
    soul: {
        'traditional': { name: 'Traditional Reform', price: 0 },
        'menthol': { name: 'Icy Menthol', price: 0 },
        'floral': { name: 'Wild Floral', price: 50 }
    },
    scent: {
        'eucalyptus': { name: 'Eucalyptus', price: 10 },
        'peppermint': { name: 'Peppermint', price: 10 },
        'bergamot': { name: 'Bergamot', price: 15 },
        'clove': { name: 'Clove', price: 15 }
    }
};

// Step Navigation
document.querySelectorAll('.step-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const step = btn.dataset.step;
        goToStep(step);
    });
});

function goToStep(stepNumber) {
    // Hide all steps
    document.querySelectorAll('.builder-step').forEach(el => el.style.display = 'none');
    document.getElementById(`step-${stepNumber}`).style.display = 'block';
    
    // Update tabs
    document.querySelectorAll('.step-btn').forEach(btn => btn.classList.remove('active'));
    document.querySelector(`.step-btn[data-step="${stepNumber}"]`).classList.add('active');
}

// Selection Logic
function selectOption(category, key) {
    // Update state
    currentOrder[category] = prices[category][key];
    
    // Visual update
    // Remove active class from siblings in same container
    const container = document.querySelector(`[onclick="selectOption('${category}', '${key}')"]`).parentNode;
    Array.from(container.children).forEach(child => child.style.borderColor = 'transparent');
    
    // Add active class to clicked
    const element = document.querySelector(`[onclick="selectOption('${category}', '${key}')"]`);
    element.style.borderColor = 'var(--color-accent)';
    
    // Auto advance for single select logic (optional, maybe nice for UX)
    // if (category === 'vessel') goToStep(2);
    // if (category === 'soul') goToStep(3);
}

function toggleOption(category, key) {
    const item = prices[category][key];
    const index = currentOrder.scents.findIndex(s => s.name === item.name);
    
    const element = document.querySelector(`[onclick="toggleOption('${category}', '${key}')"]`);
    
    if (index === -1) {
        // Add
        currentOrder.scents.push(item);
        element.style.borderColor = 'var(--color-accent)';
    } else {
        // Remove
        currentOrder.scents.splice(index, 1);
        element.style.borderColor = 'transparent';
    }
}

function showCheckout() {
    // Capture user input
    currentOrder.label = document.getElementById('labelName').value || "PRUNG DOM";
    
    // Calculate Total
    let total = currentOrder.vessel.price;
    if (currentOrder.soul) total += currentOrder.soul.price;
    currentOrder.scents.forEach(s => total += s.price);
    
    // Generate HTML
    const summaryHtml = `
        <h4 style="border-bottom: 1px solid var(--color-border); padding-bottom: 10px; margin-bottom: 10px;">Order Summary</h4>
        <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
            <span>Vessel: ${currentOrder.vessel.name}</span>
            <span>${currentOrder.vessel.price} THB</span>
        </div>
        <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
            <span>Soul: ${currentOrder.soul ? currentOrder.soul.name : 'Not Selected'}</span>
            <span>${currentOrder.soul ? currentOrder.soul.price : 0} THB</span>
        </div>
        ${currentOrder.scents.map(s => `
            <div style="display: flex; justify-content: space-between; margin-bottom: 5px; padding-left: 10px; color: var(--color-text-muted);">
                <span>+ ${s.name}</span>
                <span>${s.price} THB</span>
            </div>
        `).join('')}
         <div style="display: flex; justify-content: space-between; margin-bottom: 5px; margin-top: 10px;">
            <span>Label: ${currentOrder.label}</span>
            <span>Free</span>
        </div>
        <div style="display: flex; justify-content: space-between; margin-top: 15px; font-size: 1.2rem; font-weight: bold; border-top: 1px solid var(--color-border); padding-top: 10px;">
            <span>Total</span>
            <span style="color: var(--color-accent);">${total} THB</span>
        </div>
    `;
    
    document.getElementById('order-summary').innerHTML = summaryHtml;
    
    // Hide builder steps
    document.querySelectorAll('.builder-step').forEach(el => el.style.display = 'none');
    document.getElementById('checkout-section').style.display = 'block';
}

// Expose to global scope for HTML onclick
window.selectOption = selectOption;
window.toggleOption = toggleOption;
window.showCheckout = showCheckout;
