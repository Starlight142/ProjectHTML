<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Pages_Account_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 323px">Name: </td>
                <td>
                    
 
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:TextBox ID="txtName" runat="server" AutoPostBack="True" Width="268px" OnTextChanged="txtName_TextChanged"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Label ID="lblCheck" runat="server"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <asp:Label ID="Label1" runat="server" Text="กำลังตรวจสอบ... รอแพ็บ"></asp:Label>   
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    
 
                </td>
            </tr>
            <tr>
                <td style="width: 323px; height: 28px">Password: </td>
                <td style="height: 28px">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 28px; width: 323px;">Confirm Password: </td>
                <td style="height: 28px">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirm" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 26px; width: 323px;">E-mail:</td>
                <td style="height: 26px">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="แก้ด้วย" ForeColor="#FF3300" 
                        ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|co\.th|or\.th|ac\.th|go\.th)"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 323px; height: 27px; text-align: left;">
                    <asp:Button ID="btnRegister" runat="server" Text="register" OnClick="btnRegister_Click" />
                </td>
                <td style="height: 27px"></td>
            </tr>
            <tr>
                <td style="width: 323px">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" 
                        ControlToValidate="txtConfirm" ErrorMessage="Password must match" ForeColor="#FF3300" 
                        SetFocusOnError="True"></asp:CompareValidator>
                    <br />
                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
    </p>
</asp:Content>

