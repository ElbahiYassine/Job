<%@ Page Title="Candidate" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="candidat.aspx.cs" Inherits="JobFjib_Empty.Profil.candidat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/price_rangs.css">
    <link rel="stylesheet" href="/assets/css/flaticon.css">
    <link rel="stylesheet" href="/assets/css/slicknav.css">
    <link rel="stylesheet" href="/assets/css/animate.min.css">
    <link rel="stylesheet" href="/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/assets/css/slick.css">
    <link rel="stylesheet" href="/assets/css/nice-select.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <style>
        body
        {
            
        }
        @media (max-width:767px)
        {
            .inf-can li
            {
                width:100%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="job-post-company pt-30 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server">
                    <ItemTemplate>
                        <div class="row justify-content-between">

                            <div class="col-12">
                                <!-- job single -->
                                <div class="single-job-items mb-50">
                                    <div class="job-items">

                                        <div class="company-img company-img-details">
                                            <a href="#">
                                                <img src="/UserImages/<%#Eval("photo")%>" alt="">
                                            </a>
                                        </div>

                                        <div class="job-tittle">
                                            <a href="#" style="text-transform: uppercase; text-decoration: none">
                                                <h4><%#Eval("nom")%> <%#Eval("prenom")%></h4>
                                            </a>
                                            <ul class="inf-can">
                                                <li><i class="fas fa-map-marker-alt"></i><%#Eval("ville")%></li>
                                                <li>Niveau d'etude: <%#Eval("nv")%></li>
                                                <li>Profession: <%#Eval("profession")%></li>
                                                <li>Experience: <%#Eval("experience")%></li>
                                                <li><a href="<%#Eval("cv")%>">Voir C.V</a></li>
                                                <li>Telephone: <%#Eval("tel")%></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- job single End -->

                                <div class="job-post-details">
                                    <div class="post-details1 mb-50 col-12">
                                        <!-- Small Section Tittle -->
                                        <div class="small-section-tittle">
                                            <h4>À propos de <%#Eval("prenom")%></h4>
                                        </div>
                                        <p><%#Eval("profil")%></p>
                                    </div>

                                </div>

                                <%
                                    if (Session["idUser"] != null)
                                    {
                                        if (Session["UserType"].ToString() == "entreprise")
                                        {

                                        
                %>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" runat="server">Envoyez</button>
                <%
                        }

                    }
                    else
                    {
                        Response.Redirect("~/Compte/Login.aspx");
                    }
                %>

                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <%--<div runat="server" id="pourEntreprise">
                    <button id="btnRec" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" runat="server">Recrute ce candidat</button>
                </div>--%>
            </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Recrute Candidats</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-group">
                    <asp:Label Text="Selectionner une emplois pour ce candidat." runat="server" />
                    <asp:DropDownList ID="dlEmplois" class="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" runat="server" id="btnPostuler" onserverclick="btnPostuler_ServerClick">Envoyez</button>
                </div>
            </div>
        </div>
    </div>








   <!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="/assets/js/vendor/modernizr-3.5.0.min.js"></script>

		<!-- Jquery, Popper, Bootstrap -->
		<script src="/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="/assets/js/popper.min.js"></script>

	    <!-- Jquery Mobile Menu -->
        <script src="/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Range -->
        <script src="/assets/js/owl.carousel.min.js"></script>
        <script src="/assets/js/slick.min.js"></script>
        <script src="/assets/js/price_rangs.js"></script>

		<!-- One Page, Animated-HeadLin -->
        <script src="/assets/js/wow.min.js"></script>
		<script src="/assets/js/animated.headline.js"></script>
        <script src="/assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="/assets/js/jquery.scrollUp.min.js"></script>
        <script src="/assets/js/jquery.nice-select.min.js"></script>
		<script src="/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="/assets/js/contact.js"></script>
        <script src="/assets/js/jquery.form.js"></script>
        <script src="/assets/js/jquery.validate.min.js"></script>
        <script src="/assets/js/mail-script.js"></script>
        <script src="/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="/assets/js/plugins.js"></script>
        <script src="/assets/js/main.js"></script>


</asp:Content>
