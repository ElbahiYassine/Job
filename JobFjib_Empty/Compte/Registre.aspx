<%@ Page Title="Registre" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Registre.aspx.cs" Inherits="JobFjib_Empty.Compte.Registre" %>
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
               <a href="Login.aspx" class="btnBascul">Se Connecter</a>
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
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" CssClass="erreur" ErrorMessage="Email Oubligatoir." ForeColor="Red"  Display="Static" />
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="erreur" ErrorMessage="Email Invalide" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression='^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$'></asp:RegularExpressionValidator>
                </div>

                <div class="frm_grp">
                    <label for="UserType" class="ic_ mr-10">
                        <i class="fas fa-user-circle"></i>
                    </label>

                    <asp:DropDownList ID="UserType" runat="server" class="inp_">
                        <asp:ListItem Value="candidat">Candidat</asp:ListItem>
                        <asp:ListItem Value="entreprise">Entreprise</asp:ListItem>
                    </asp:DropDownList>
               </div>
                    <br>
               <div class="frm_grp">
                   <label for="txtMdp" class="ic_">
                   <i class="fas fa-lock"></i>
               </label>
                  <asp:TextBox ID="txtMdp" runat="server" class="inp_"  type="password" name="txtMdp" placeholder="Mot de Passe"></asp:TextBox>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMdp" ForeColor="Red"
                                CssClass="erreur" ErrorMessage="Mot de Passe est Oubligatoir"  Display="Static" />
               </div>

               <div class="btn_">
                   <asp:Button ID="btnInscription"  runat="server" Text="Inscription" OnClick="btnInscription_Click" />
               </div>
            </div>
            </div>
        </div>

    </div>

</asp:Content>
