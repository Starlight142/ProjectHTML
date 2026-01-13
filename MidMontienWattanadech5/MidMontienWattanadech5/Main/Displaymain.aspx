<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Displaymain.aspx.cs" Inherits="Main_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="กรุณาเลือกอาหารหรือเครื่องดื่ม: "></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>-กรุณาเลือก-</asp:ListItem>
                <asp:ListItem>Eye shadow</asp:ListItem>
                <asp:ListItem>lip stick</asp:ListItem>
                <asp:ListItem>Powder blush</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="EyeShadow" runat="server">
                <table class="auto-style17">
                    <tr>
                        <td class="auto-style5">Eye Shadow</td>
                        <td class="auto-style7">ราคา</td>
                        <td class="auto-style12">จำนวน</td>
                        <td class="auto-style2">ราคารวม</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <asp:CheckBox ID="ckOne" runat="server" AutoPostBack="True" OnCheckedChanged="ckOne_CheckedChanged" Text="Extra " />
                        </td>
                        <td class="auto-style14">
                            <asp:Label ID="lblPrice1" runat="server" Text="50"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="txtQN1" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN1_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="txtTotal1" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="ckTwo" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="lblPrice2" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtQN2" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN2_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="txtTotal2" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="ckTwo0" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="lblPrice3" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtQN3" runat="server" OnTextChanged="txtQN2_TextChanged" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="txtTotal3" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="LipStick" runat="server">
                <table class="auto-style17">
                    <tr>
                        <td class="auto-style5">Lip Stick</td>
                        <td class="auto-style7">ราคา</td>
                        <td class="auto-style12">จำนวน</td>
                        <td class="auto-style2">ราคารวม</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="ckOne_CheckedChanged" Text="ข้าวขาหมู" />
                        </td>
                        <td class="auto-style14">
                            <asp:Label ID="Label2" runat="server" Text="50"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="TextBox1" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN1_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="TextBox2" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="Label3" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="TextBox3" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN2_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="TextBox4" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="Label4" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="txtQN2_TextChanged" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="TextBox6" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="Powderblush" runat="server">
                <table class="auto-style17">
                    <tr>
                        <td class="auto-style5">Powder blush</td>
                        <td class="auto-style7">ราคา</td>
                        <td class="auto-style12">จำนวน</td>
                        <td class="auto-style2">ราคารวม</td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="True" OnCheckedChanged="ckOne_CheckedChanged" Text="ข้าวขาหมู" />
                        </td>
                        <td class="auto-style14">
                            <asp:Label ID="Label5" runat="server" Text="50"></asp:Label>
                        </td>
                        <td class="auto-style15">
                            <asp:TextBox ID="TextBox7" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN1_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style16">
                            <asp:TextBox ID="TextBox8" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="Label6" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="TextBox9" runat="server" Visible="False" Width="277px" OnTextChanged="txtQN2_TextChanged"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="TextBox10" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="True" OnCheckedChanged="ckTwo_CheckedChanged" Text="ข้าวผัดปู" />
                        </td>
                        <td class="auto-style19">
                            <asp:Label ID="Label7" runat="server" Text="60"></asp:Label>
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="TextBox11" runat="server" OnTextChanged="txtQN2_TextChanged" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                        <td class="auto-style21">
                            <asp:TextBox ID="TextBox12" runat="server" BackColor="#CCCCCC" ReadOnly="True" Visible="False" Width="277px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <asp:Button ID="btnClick" runat="server" Text="Click to order" Visible="False" OnClick="btnClick_Click" />
        </div>
    </form>
</body>
</html>
