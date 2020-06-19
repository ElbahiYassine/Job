<%@ Page Title="Acceuil" Language="C#" MasterPageFile="~/mainLayout.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JobFjib_Empty.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/homeStyle.css" rel="stylesheet" />

        <style>
        #overview {
            background-image: url('/img/headright.png');
            padding: 80px 10%;
            height:500px;
            background-position:bottom;
            background-size:cover;

            background-repeat:no-repeat;

        }

        .divInfo
        {
            color:#49ABF1;
            width:50%;
        }

         .titre
        {
            transition:all 0.5s ease-out;
        }

        @media screen and (max-width:790px) 
        {
            #overview
                {
                    background-position:left bottom;
                    background-repeat:no-repeat;
                }
            .divInfo
            {
                width:100%;
            }
            .hide-mb{
                display:none;
            }
            .titre
            {
                font-size:30px;
                transition:all 0.2s ease-out;
                text-align:center;
            }
        }

        @media screen and (max-width:690px) 
        {
            .titre
            {
                font-size:26px;
                transition:all 0.2s ease-out;
                text-align:center;
            }
        }
        
        .card
        {
            margin-bottom:15px;
            height:350px;
        }

        .card-title
        {
            font-size:18px;
        }


        #derEmplois
        {
            background: rgb(184,217,241);
            background: linear-gradient(0deg, rgba(184,217,241,1) 0%, rgba(255,255,255,1) 100%);

            padding:20px ;
            
            
            
        }

        #derCandidat
        {
            background: rgb(255,255,255);
            background: linear-gradient(0deg, rgba(255,255,255,1) 0%, rgba(183,216,241,1) 100%);
            padding:20px;
        }

        .box-Content {
    border: 3px solid #fff;
    text-align: center;
    background: #fff;
    margin-bottom: 30px;
}

    </style>



    <section id="overview">

        <div class="divInfo">
            <h2 class="titre">Vous êtes à la recherche d'un travail?</h2>
            <h2 class="titre">Ou Vous avez besoin des Employées ?</h2>

            <p>Vous êtes au bon endroit.JOB-FJIB est votre intermédiaire.</p>

            <p>Candidat ? Vous cherchez un emploi ? <a href="#derEmplois">Postuler</a> maintenant des dizaines d'offres vous attends</p>

            <p>Entreprise ? <a href="#secPost">content</a> des Annonces de travail ou tout simplement <a href="#derCandidat">choisir</a> vous salaries à partir du catalogue.</p>
        </div>


    </section>

    <section id="derEmplois">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-head">
                        <h2>Dernières offres d'emploi</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:Repeater ID="repEmplois" runat="server" OnItemCommand="repEmplois_ItemCommand">
                    <ItemTemplate>

                        <div class="col-lg-3 col-md-6">
                            <div class="box-Content">
                                <div class="box-Head" style="background-image: url(/Logo_Entreprise/<%#Eval("logo")%>)">

                                    <h2 class="h2-wrap"><%#Eval("profession")%></h2>
                                </div>
                                <div class="box-Infos">
                                    <p class="desc-wr">
                                        <%#Eval("titre")%>
                                        <div class="vilsa">
                                            <div>
                                                <i class="fas fa-map-marker-alt"></i>
                                                <%#Eval("ville")%>
                                            </div> 

                                            <div>
                                                <i class="fas fa-money-bill-wave"></i>
                                                <%#Eval("salaire")%>
                                            </div>
                                        </div>
                                    </p>
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-area" CommandName="btnEmp" CommandArgument='<%#Eval("idEmploi")%>'>Voir Details</asp:LinkButton>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <div class="row">
                    <div class="col-md-12">
                        <div class="section-bottom">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-area" PostBackUrl="~/Emp/emplois.aspx">Tout les emplois <i class="fas fa-long-arrow-alt-right"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
        </div>
    </section>


    <section id="derCandidat">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-head">
                        <h2>Dernières Candidats</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:Repeater ID="reCandidats" runat="server" OnItemCommand="reCandidats_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-6">
                            <div class="box-Content">
                                <div class="box-Head" style="background-image: url(/UserImages/<%#Eval("photo")%>)">

                                    <h2 class="h2-wrap"><%#Eval("prenom")%> <%#Eval("nom")%></h2>
                                </div>
                                <div class="box-Infos">
                                    <p class="desc-wr">
                                        <%#Eval("profil")%>
                                        <div class="vilsa">
                                            <div>
                                                <i class="fas fa-map-marker-alt"></i>
                                                <%#Eval("ville")%>
                                            </div>

                                            <div>
                                                <i class="fas fa-user-tie"></i>
                                                <%#Eval("Profession")%>
                                            </div>
                                        </div>
                                    </p>
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-area" CommandName="btnCan" CommandArgument='<%#Eval("candidatId")%>'>Voir Profil</asp:LinkButton>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="section-bottom">
                        <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-area" PostBackUrl="~/Profil/Candidats.aspx">Tout les Candidats <i class="fas fa-long-arrow-alt-right"></i></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>



    </section>

    <section id="secPost">

    </section>
</asp:Content>



