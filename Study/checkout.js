document.addEventListener('DOMContentLoaded', () => {
    loadCart();
    setupForm();
});

function loadCart() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartItemsContainer = document.getElementById('checkoutCartItems');
    const orderTotalEl = document.getElementById('orderTotal');
    const cartCountEl = document.getElementById('checkoutCartCount');

    if (cartCountEl) cartCountEl.textContent = cart.length;

    if (cart.length === 0) {
        if (cartItemsContainer) cartItemsContainer.innerHTML = '<div class="empty-cart-msg">Your cart is empty. <a href="index.html" style="color: var(--primary);">Go back to shop</a></div>';
        if (orderTotalEl) orderTotalEl.textContent = '$0.00';
        return;
    }

    if (cartItemsContainer) {
        cartItemsContainer.innerHTML = '';
        let total = 0;

        cart.forEach(item => {
            total += item.price;
            const herbNames = item.herbs.map(h => h.name).join(', ');

            // Use the first herb's color for the icon background or a default
            const primaryColor = item.herbs[0]?.color || '#1A4D2E';

            const itemEl = document.createElement('div');
            itemEl.className = 'checkout-item';
            itemEl.innerHTML = `
                <div class="item-icon" style="background-color: ${primaryColor}">🌿</div>
                <div class="item-details">
                    <h4>Custom Inhaler Blend</h4>
                    <p class="item-ingredients">${herbNames}</p>
                    ${item.name ? `<p class="item-name">"${item.name}"</p>` : ''}
                </div>
                <div class="item-price">$${item.price.toFixed(2)}</div>
            `;
            cartItemsContainer.appendChild(itemEl);
        });

        // Add shipping (mock)
        const shipping = 5.00;
        const finalTotal = total + shipping;

        // Insert Shipping Row
        const shippingEl = document.createElement('div');
        shippingEl.className = 'checkout-summary-row';
        shippingEl.innerHTML = `
            <span>Shipping</span>
            <span>$${shipping.toFixed(2)}</span>
        `;
        cartItemsContainer.appendChild(document.createElement('hr'));
        cartItemsContainer.appendChild(shippingEl);

        if (orderTotalEl) orderTotalEl.textContent = `$${finalTotal.toFixed(2)}`;
    }
}

function setupForm() {
    const form = document.getElementById('checkoutForm');
    if (!form) return;

    // Format Card Number with spaces
    const cardInput = document.getElementById('cardNumber');
    if (cardInput) {
        cardInput.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\D/g, '');
            value = value.match(/.{1,4}/g)?.join(' ') || value;
            e.target.value = value.substring(0, 19); // 16 digits + 3 spaces
        });
    }

    // Format Expiry
    const expiryInput = document.getElementById('cardExpiry');
    if (expiryInput) {
        expiryInput.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length >= 2) {
                value = value.substring(0, 2) + '/' + value.substring(2, 4);
            }
            e.target.value = value.substring(0, 5);
        });
    }

    form.addEventListener('submit', (e) => {
        e.preventDefault();

        const btn = form.querySelector('.payment-btn');
        const originalText = btn.innerHTML;

        btn.disabled = true;
        btn.innerHTML = '<span class="spinner"></span> Processing...';

        // Simulate API complexity
        setTimeout(() => {
            btn.innerHTML = 'Payment Approved! <span style="font-size:1.2rem">✅</span>';
            btn.style.backgroundColor = '#4CAF50';
            btn.style.boxShadow = '0 0 20px rgba(76, 175, 80, 0.4)';

            // Clear cart
            localStorage.removeItem('cart');

            setTimeout(() => {
                alert('Thank you for your purchase! Your order is being confirmed.');
                const isRazor = window.location.pathname.includes('/Checkout');
                window.location.href = isRazor ? '/' : 'index.html';
            }, 1000);
        }, 2000);
    });

    // Input animation logic
    const inputs = form.querySelectorAll('input');
    inputs.forEach(input => {
        input.addEventListener('focus', () => {
            input.parentElement.classList.add('focused');
        });
        input.addEventListener('blur', () => {
            if (!input.value) {
                input.parentElement.classList.remove('focused');
            }
        });
    });
}
