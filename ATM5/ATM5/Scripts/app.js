
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
    //const category = document.getElementById('itemCategory').value;
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
}
