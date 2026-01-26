<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="Etest.Simple" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Simple CRUD - No Style</title>
    </head>

    <body>
        <div style="margin-bottom: 20px;">
            <a href="index.aspx">⬅ Back to Modern Design</a>
        </div>
        <h1>Simple Inventory Management</h1>

        <div id="formSection">
            <h3>Add/Edit Item</h3>
            <input type="hidden" id="itemId" />
            Name: <input type="text" id="itemName" /><br />
            Category: <input type="text" id="itemCategory" /><br />
            Price: <input type="number" id="itemPrice" step="0.01" /><br />
            Quantity: <input type="number" id="itemQuantity" /><br />
            <button id="saveBtn">Save Item</button>
            <button id="cancelBtn">Clear</button>
        </div>

        <hr />

        <div id="tableSection">
            <h3>Current Inventory</h3>
            <table border="1" id="inventoryTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="inventoryBody">
                    <!-- Data will go here -->
                </tbody>
            </table>
        </div>

        <script>
            async function apiCall(method, data = {}) {
                const response = await fetch(`Simple.aspx/${method}`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                const result = await response.json();
                return result.d;
            }

            async function loadItems() {
                const items = await apiCall('GetItems');
                const body = document.getElementById('inventoryBody');
                body.innerHTML = '';
                items.forEach(item => {
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.category}</td>
                    <td>$${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>
                        <button onclick="editItem('${item.id}', '${item.name}', '${item.category}', ${item.price}, ${item.quantity})">Edit</button>
                        <button onclick="deleteItem(${item.id})">Delete</button>
                    </td>
                `;
                    body.appendChild(tr);
                });
            }

            async function saveItem() {
                const id = document.getElementById('itemId').value;
                const name = document.getElementById('itemName').value;
                const category = document.getElementById('itemCategory').value;
                const price = document.getElementById('itemPrice').value;
                const quantity = document.getElementById('itemQuantity').value;

                let result;
                if (id) {
                    result = await apiCall('UpdateItem', { id: parseInt(id), name, category, price, quantity });
                } else {
                    result = await apiCall('AddItem', { name, category, price, quantity });
                }

                if (result === "Success") {
                    alert("Saved!");
                    clearForm();
                    loadItems();
                } else {
                    alert(result);
                }
            }

            async function deleteItem(id) {
                if (confirm("Delete?")) {
                    const result = await apiCall('DeleteItem', { id: id });
                    if (result === "Success") loadItems();
                }
            }

            function editItem(id, name, category, price, quantity) {
                document.getElementById('itemId').value = id;
                document.getElementById('itemName').value = name;
                document.getElementById('itemCategory').value = category;
                document.getElementById('itemPrice').value = price;
                document.getElementById('itemQuantity').value = quantity;
            }

            function clearForm() {
                document.getElementById('itemId').value = '';
                document.getElementById('itemName').value = '';
                document.getElementById('itemCategory').value = '';
                document.getElementById('itemPrice').value = '';
                document.getElementById('itemQuantity').value = '';
            }

            document.getElementById('saveBtn').onclick = saveItem;
            document.getElementById('cancelBtn').onclick = clearForm;

            loadItems();
        </script>
    </body>

    </html>