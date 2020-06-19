<%@ Page Title="List Emplois" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="emplois.aspx.cs" Inherits="JobFjib_Empty.Emp.emplois" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
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

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="job-listing-area pt-50 pb-120">
        <div class="container-fluid">
            <div class="row">

                <div class="col-xl-3 col-lg-3 col-md-4">
                    <div class="row">
                        <div class="col-12">
                                <div class="small-section-tittle2 mb-45">
                                <div class="ion"> <svg 
                                    xmlns="http://www.w3.org/2000/svg"
                                    xmlns:xlink="http://www.w3.org/1999/xlink"
                                    width="20px" height="12px">
                                <path fill-rule="evenodd"  fill="rgb(27, 207, 107)"
                                    d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z"/>
                                </svg>
                                </div>
                                <h4>Filtrer les les emplois</h4>
                            </div>
                        </div>
                    </div>

                    <div class="job-category-listing mb-50">

                        <div class="single-listing">

                            <div class="small-section-tittle2">
                                    <h4>Domain de travaill</h4>
                            </div>


                            <div class="select-job-items2">
                                <asp:DropDownList ID="dlDomain" runat="server" name="select" OnSelectedIndexChanged="dlDomain_SelectedIndexChanged" AutoPostBack="false" ></asp:DropDownList>
                            </div>

                            <div class="select-Categories pt-80 pb-50">
                                <div class="small-section-tittle2">
                                    <h4>Location de travaill</h4>
                                </div>
                                <div class="select-job-items2">

                                <asp:DropDownList ID="dlVille" runat="server" name="select" OnSelectedIndexChanged="dlVille_SelectedIndexChanged" AutoPostBack="false" >

                                </asp:DropDownList>
                              
                                </div>
                            </div>

                        </div>

                        <div class="single-listing pt-40">

                            <div class="small-section-tittle2">
                                    <h4>Type de Contrat</h4>
                            </div>


                            <div class="select-job-items2">
                                <asp:DropDownList ID="dlContrat" runat="server" name="select" OnSelectedIndexChanged="dlContrat_SelectedIndexChanged" AutoPostBack="false"></asp:DropDownList>
                            </div>

                        </div>

                        <div class="single-listing pt-50">
                            <input type="submit" runat="server" class="genric-btn primary-border" style="width:100%;font-size:16px;font-weight:500;" onserverclick="Unnamed_Click" value="Filtré" />
                        </div>

                    </div>

                </div>


                <div class="col-xl-9 col-lg-9 col-md-8">
                    <!-- Featured_job_start -->
                    <section class="featured-job-area">
                        <div class="container">

                            <asp:Repeater ID="repEmplois" runat="server" OnItemCommand="repEmplois_ItemCommand">
                                <ItemTemplate>

                                    <div class="single-job-items mb-30">
                                                <div class="job-items">
                                                    <div class="company-img">
                                                        <a href="#"><img src="/Logo_Entreprise/<%#Eval("logo")%>" alt=""></a>
                                                    </div>
                                                    <div class="job-tittle job-tittle2">
                                                        <h4><%#Eval("profession")%></h4>
                                                        <ul>
                                                            <li><%#Eval("Nom")%></li>
                                                            <li><i class="fas fa-map-marker-alt"></i><%#Eval("ville")%></li>
                                                            <li><%#Eval("salaire")%></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="items-link items-link2 f-right">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-area" CommandName="btnEmp" CommandArgument='<%#Eval("idEmploi")%>'>Voir Details</asp:LinkButton>
                                                    <span><%#Eval("dateCreation")%></span>
                                                </div>
                                            </div>
                                </ItemTemplate>
                            </asp:Repeater>
                                
                        </div>
                    </section>
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