<%@ Page Title="Emploi" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="emploi.aspx.cs" Inherits="JobFjib_Empty.Emp.emploi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <div class="container" style="padding-top:20px;">
        <asp:Repeater ID="repEmploi" runat="server">
            <ItemTemplate>

                <div class="form-group">
                    <label runat="server" id="txtTitre"><%#Eval("titre") %></label>
                </div>

                <div class="form-group">
                    <label >Description</label>
                    <textarea runat="server" class="form-control" id="txtDescrip" rows="20" style="height:auto" readonly><%#Eval("descrip")%></textarea>
                </div>

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label>Domain: <%#Eval("domain") %> </label>
                    </div>

                    <div class="form-group col-md-6">
                        <label>Nombre de Postes: <%#Eval("nbPostes") %> </label>
                    </div>

                </div>

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label>Ville: <%#Eval("ville") %> </label>
                    </div>

                    <div class="form-group col-md-6">
                        <label>Salaire: <%#Eval("Salaire") %> </label>
                    </div>
                </div>

                

                <%
                    if (Session["idUser"] != null)
                    {
                        if (Session["UserType"].ToString() == "candidat")
                        {

                %>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" runat="server">Postuler</button>
                <%
                        }
                    }
                    else
                    {
                        Response.Redirect("~/Compte/Login.aspx");
                    }
                %>


                
            </ItemTemplate>
        </asp:Repeater>

    </div>

    

                    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Postuler Demande</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-group">
                    <asp:Label Text="Lettre de Motivation" runat="server" />
                    <asp:TextBox ID="txtLettre" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" runat="server" id="btnPostuler" onserverclick="btnPostuler_ServerClick" >Envoyez</button>
                </div>
            </div>
        </div>
    </div>



    <script src="~/Scripts/alerts.js"></script>

</asp:Content>
