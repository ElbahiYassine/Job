<%@ Page Title="Emploi" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="emploi.aspx.cs" Inherits="JobFjib_Empty.Emp.emploi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

    <div class="container" style="padding-top:20px;">
        <asp:Repeater ID="repEmploi" runat="server">
            <ItemTemplate>

                <div class="form-group">
                    <h3><label runat="server" id="txtTitre"><%#Eval("titre") %></label></h3>
                </div>

                <div class="form-group">
                    <label><span style="color:black; font-weight:bold; margin-right:2px;">Description:</span></label>
                    <textarea runat="server" class="form-control" id="txtDescrip" rows="20" style="height:auto; background-color:aliceblue;" readonly><%#Eval("descrip")%></textarea>
                </div>

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label><span style="color:black; font-weight:bold; margin-right:2px;"> Domaine:</span> <%#Eval("domain") %> </label>
                    </div>

                    <div class="form-group col-md-6">
                        <label><span style="color:black; font-weight:bold; margin-right:2px;">Nombre de Postes:</span> <%#Eval("nbPostes") %> </label>
                    </div>

                </div>

                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label><span style="color:black; font-weight:bold; margin-right:2px;">Ville:</span> <%#Eval("ville") %> </label>
                    </div>

                    <div class="form-group col-md-6">
                        <label><span style="color:black; font-weight:bold; margin-right:2px;">Salaire:</span> <%#Eval("Salaire") %> </label>
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
