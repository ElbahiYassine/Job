<%@ Page Title="Login" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobFjib_Empty.Compte.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Content/loginCss.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <script src="../Scripts/alerts.js"></script>
    <div class="main">
        <div class="head">
           <div class="topHead">
               <img src="/img/logo.png" alt="" id="logo"/>
               <a href="Registre.aspx" class="btnBascul">Inscrire</a>
           </div>
            <img src="/img/topBack.png" alt="">
            <asp:Label ID="erreur" class="footHead" runat="server">En vous inscrivant sur ce site Web, vous acceptez nos <a href="#">Conditions d'utilisation</a> et notre <a href="#">Politique de confidentialité</a></asp:Label>
        </div>
        <div class="foot">

            <div >
                <div class="frm_" >

               <div class="frm_grp">
                   <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="ic_">
                       <i class="fas fa-envelope"></i>
                   </asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" class="inp_" TextMode="Email" placeholder="Email"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                CssClass="erreur" ErrorMessage="Email Oubligatoir." ForeColor="Red"  Display="Static" />
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                       CssClass="erreur" ErrorMessage="Email Invalide" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression='^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$'></asp:RegularExpressionValidator>
                </div>

               <div class="frm_grp">
                   <label for="txtMdp" class="ic_">
                   <i class="fas fa-lock"></i>
               </label>
                  <asp:TextBox ID="txtMdp" runat="server" class="inp_"  type="password" name="txtMdp" placeholder="Mot de Passe"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMdp"
                                CssClass="erreur" ErrorMessage="Mot de Passe est Oubligatoir"  Display="Static" />
               </div>

               <div class="btn_">
                   <asp:Button ID="btnLogin"  runat="server" Text="Connexion" OnClick="btnLogin_Click" />
               </div>
            </div>
            </div>
        </div>

    </div>
</asp:Content>
