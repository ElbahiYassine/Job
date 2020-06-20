<%@ Page Title="Completer info Entreprise" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="CInfosE.aspx.cs" Inherits="JobFjib_Empty.CInfosE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <div class="container">

        <div class="form-row">

            <div class="form-group col-md-6">

                <label for="txtNom">Nom de Entreprise</label>
                <input type="text" class="form-control" id="txtNom" runat="server" placeholder="Nom de Entreprise">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Nom Entreprise est Obligatoire" ForeColor="Red" ControlToValidate="txtNom" CssClass="valErreur">*</asp:RequiredFieldValidator>
                        
            </div>

            <div class="form-group col-md-6">
                <label for="logoUp">LOGO</label>
                <asp:FileUpload ID="logoUp" class="form-control-file form-control" runat="server" />
               <%--<asp:RequiredFieldValidator  ID="RequiredFieldValidator12" runat="server" ForeColor="Red" ControlToValidate="logoUp" ErrorMessage="choisir un logo!">*</asp:RequiredFieldValidator> --%>

            </div>

        </div>

        <div class="form-group">
            <label for="txtdescription">Description D'entreprise</label>
            <input type="text" class="form-control" id="txtdescription" runat="server" placeholder="Description"> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Description d'Entreprise est Obligatoire" ForeColor="Red" ControlToValidate="txtdescription" CssClass="valErreur">*</asp:RequiredFieldValidator>
                        
        </div>

        <div class="form-row">

            <div class="form-group col-md-6">
                <label for="txtAdresse">Adresse</label>
                <input type="text" class="form-control" id="txtAdresse" runat="server" placeholder="Adresse">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Adresse d'Entreprise est Obligatoire" ForeColor="Red" ControlToValidate="txtAdresse" CssClass="valErreur">*</asp:RequiredFieldValidator>
             
            </div>

            <div class="form-group col-md-3">
                <label for="txtVille">Ville</label>
                <input type="text" class="form-control" id="txtVille" runat="server" placeholder="Ville">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ville d'Entreprise est Obligatoire" ForeColor="Red" ControlToValidate="txtVille" CssClass="valErreur">*</asp:RequiredFieldValidator>
             
            </div>

            <div class="form-group col-md-3">
                <label for="txtDate">Dete de Creation</label>
                <input type="date" class="form-control" id="txtDate" runat="server">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Date  d'Entreprise est Obligatoire" ForeColor="Red" ControlToValidate="txtDate" CssClass="valErreur">*</asp:RequiredFieldValidator>
             
            </div>

        </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <button type="submit" class="btn btn-primary" runat="server" id="btn_Completez" onserverclick="btn_Completez_ServerClick">Completez</button>
    </div>
     <script src="../Scripts/alerts.js"></script>
</asp:Content>
