document.addEventListener('DOMContentLoaded', () => {
    loadCart();
    setupInputs();
});

function loadCart() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const orderItemsContainer = document.getElementById('orderItems');
    const subtotalDisplay = document.getElementById('subtotalDisplay');
    const totalDisplay = document.getElementById('totalDisplay');
    const placeOrderBtn = document.getElementById('placeOrderBtn');

    orderItemsContainer.innerHTML = '';

    if (cart.length === 0) {
        orderItemsContainer.innerHTML = '<div class="empty-state">Your cart is empty.</div>';
        subtotalDisplay.textContent = '$0.00';
        totalDisplay.textContent = '$0.00';
        placeOrderBtn.disabled = true;
        // Optionally redirect back
        // window.location.href = '/';
        return;
    }

    let subtotal = 0;

    cart.forEach(item => {
        subtotal += item.price;
        const herbNames = item.herbs && Array.isArray(item.herbs)
            ? item.herbs.map(h => h.name).join(', ')
            : 'Custom Blend';

        const itemEl = document.createElement('div');
        itemEl.className = 'summary-item';
        itemEl.innerHTML = `
            <div class="summary-item-details">
                <h4>${item.name}</h4>
                <div class="summary-item-sub">${herbNames}</div>
            </div>
            <div class="summary-item-price">$${item.price.toFixed(2)}</div>
        `;
        orderItemsContainer.appendChild(itemEl);
    });

    subtotalDisplay.textContent = `$${subtotal.toFixed(2)}`;
    totalDisplay.textContent = `$${subtotal.toFixed(2)}`; // Assuming free shipping
}

function setupInputs() {
    // Payment Method Toggle
    const paymentOptions = document.querySelectorAll('.payment-option');
    paymentOptions.forEach(opt => {
        opt.addEventListener('click', () => {
            paymentOptions.forEach(p => p.classList.remove('selected'));
            paymentOptions.forEach(p => p.querySelector('input').checked = false);

            opt.classList.add('selected');
            opt.querySelector('input').checked = true;
        });
    });

    // Formatting for Credit Card
    const cardNum = document.getElementById('cardNum');
    if (cardNum) {
        cardNum.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\D/g, '');
            value = value.match(/.{1,4}/g)?.join(' ') || value;
            e.target.value = value;
        });
    }

    const expiry = document.getElementById('expiry');
    if (expiry) {
        expiry.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            e.target.value = value;
        });
    }

    // Place Order Logic
    const placeOrderBtn = document.getElementById('placeOrderBtn');
    placeOrderBtn.addEventListener('click', (e) => {
        e.preventDefault();

        // Simple Validation
        const required = document.querySelectorAll('input[required]');
        let valid = true;
        required.forEach(input => {
            if (!input.value) {
                input.style.borderColor = 'red';
                valid = false;
            } else {
                input.style.borderColor = '#e0e0e0';
            }
        });

        if (!valid) {
            alert('Please fill in all shipping fields.');
            return;
        }

        // Simulate Processing
        placeOrderBtn.textContent = 'Processing...';
        placeOrderBtn.disabled = true;

        setTimeout(() => {
            showSuccess();
        }, 1500);
    });
}

function showSuccess() {
    const overlay = document.getElementById('successOverlay');
    const orderIdSpan = document.getElementById('orderId');

    // Generate Random Order ID
    const orderId = Math.floor(100000 + Math.random() * 900000);
    orderIdSpan.textContent = orderId;

    // Save Order to History
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const orderHistory = JSON.parse(localStorage.getItem('orderHistory')) || [];

    const newOrder = {
        id: orderId,
        date: new Date().toISOString(),
        items: cart,
        total: cart.reduce((sum, item) => sum + item.price, 0)
    };

    orderHistory.unshift(newOrder); // Add to beginning
    localStorage.setItem('orderHistory', JSON.stringify(orderHistory));

    overlay.classList.add('active');

    // Clear Cart
    localStorage.removeItem('cart');
}
