<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ClientIDMode="Static" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title></title>
        <style type="text/css">
            .auto-style1 {
                width: 87px;
            }

            .auto-style2 {
                text-align: center;
                height: 67px;
                background-color: #33CCCC;
            }
        </style>
    </head>

    <body>
        <form id="form1" runat="server">
            <div>
                <table style="width: 100%; height: 348px;">
                    <tr>
                        <td class="auto-style2" colspan="3">
                            <h1>Please enter your information</h1>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="BookID"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="text_bookid" runat="server" OnTextChanged="text_bookid_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBookID" runat="server" ControlToValidate="text_bookid"
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revBookID" runat="server"
                                ControlToValidate="text_bookid" ErrorMessage="Must be a number" ForeColor="Red"
                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="text_name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="text_name"
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Phone"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="text_phone" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="text_phone"
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="text_phone"
                                ErrorMessage="Must be numbers" ForeColor="Red" ValidationExpression="^\d+$">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" Text="Balance"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="text_balance" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvBalance" runat="server" ControlToValidate="text_balance"
                                ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvBalance" runat="server" ControlToValidate="text_balance"
                                ErrorMessage="Must be a valid amount" ForeColor="Red" Operator="DataTypeCheck"
                                Type="Double"></asp:CompareValidator>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td style="text-align: center">
                            <!-- Use OnClientClick to prevent postback and call saveItem -->
                            <asp:Button ID="Savebtn" runat="server" Text="Save" OnClick="Button1_Click"
                                OnClientClick="saveItem(); return false;" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td style="text-align: center">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td style="text-align: center">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </form>
        <script>
            async function apiCall(method, data = {}) {
                // Changed from Simple.aspx to Default.aspx
                const response = await fetch(`Default.aspx/${method}`, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(data)
                });
                const result = await response.json();
                return result.d;
            }

            async function loadItems() {
                try {
                    const items = await apiCall('GetItems');
                    const body = document.getElementById('inventoryBody');
                    if (body) {
                        body.innerHTML = '';
                        items.forEach(item => {
                            // Verify item properties match your class definition
                            const tr = document.createElement('tr');
                            tr.innerHTML = `
                            <td>${item.bookid}</td>
                            <td>${item.bookname}</td>
                            <td>${item.phone}</td>
                            <td>${item.balance}</td>
                            <td>
                                <button onclick="editItem('${item.bookid}', '${item.bookname}', '${item.phone}', ${item.balance})">Edit</button>
                                <button onclick="deleteItem('${item.bookid}')">Delete</button>
                            </td>
                        `;
                            body.appendChild(tr);
                        });
                    }
                } catch (e) { console.error("Error loading items:", e); }
            }

            async function saveItem() {
                // Note: ClientIDMode="Static" needed for these IDs to work
                const id = document.getElementById('text_bookid').value;
                const name = document.getElementById('text_name').value;
                const phoneVal = document.getElementById('text_phone').value;
                const balanceVal = document.getElementById('text_balance').value;

                let result;
                // Match parameters to C# WebMethods: bookid, bookname, phone, balance
                if (id) {
                    // Logic depends on if you distinguish add vs update by ID existence
                    // Here we just call AddItem or UpdateItem based on assumed logic
                    // If you want Update, pass 'id' to AddItem? Or use UpdateItem?
                    // Let's assume AddItem takes care of it or we use UpdateItem for existing
                    // For now, let's just try AddItem as the user had it or UpdateItem
                    result = await apiCall('AddItem', { bookid: id, bookname: name, phone: phoneVal, balance: parseFloat(balanceVal) });
                }

                if (result === "Success") {
                    alert("Saved!");
                    // clearForm(); // Uncomment if implemented
                    // loadItems(); // Uncomment if you have a table to refresh
                } else {
                    alert(result);
                }
                return false;
            }


            function editItem(id, name, phone, balance) {
                document.getElementById('text_bookid').value = id;
                document.getElementById('text_name').value = name;
                document.getElementById('text_phone').value = phone;
                document.getElementById('text_balance').value = balance;
            }

            // Removed the incorrect onclick assignment
            // document.getElementById('SaveBtn').onclick = saveItem;

            // loadItems(); // Call this if you have a table to load
        </script>
    </body>

    </html>