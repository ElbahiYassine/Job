<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dahsboard.aspx.cs" Inherits="JobFjib_Empty.dash.dahsboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css" integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous"/>
    <link href="../Content/AddEmpstyle.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>
    <link href="../Content/sb-admin-2.css" rel="stylesheet" />
    <link href="../Content/all.css" rel="stylesheet" />
     <link href="Content/fontBaloo.css" rel="stylesheet" />
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
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/style.css" rel="stylesheet" />
    <link href="/Content/keywords.css" rel="stylesheet" />

    <style>
        label,li,form-control-file
        {
            color:black !important;
        }
    </style>

</head>
<body id="page-top">
    <form id="form1" runat="server">
       <div id="wrapper">

           <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                  
            <asp:HyperLink ID="HyperLink1" runat="server" class="sidebar-brand d-flex align-items-center justify-content-center" NavigateUrl="~/Home.aspx">
                <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">acceuil<sup>*</sup></div>
            </asp:HyperLink>

               <!-- Divider -->
               <hr class="sidebar-divider my-0">

               <!-- Nav Item - Dashboard -->
               <li class="nav-item active">
                   <a class="nav-link" runat="server" id="dashHome" onserverclick="dashHome_ServerClick">
                       <i class="fas fa-fw fa-tachometer-alt"></i>
                       <span>Tableau de Bord </span></a>
               </li>

               <!-- Divider -->
               <hr class="sidebar-divider">

               <div id="itemEntrprise" runat="server">
                   <li class="nav-item ">
                       <a class="nav-link" id="Post_Job" runat="server" onserverclick="Post_Job_ServerClick">
                           <i class="fas fa-plus"></i>
                           <span>Ajouter un Emploi</span></a>
                   </li>

                   <li class="nav-item ">
                       <a class="nav-link" id="Listjob" runat="server" onserverclick="Listjob_ServerClick">
                           <i class="fas fa-list-ul"></i>
                           <span>Mes Emplois</span></a>
                   </li>

               </div>

               <li class="nav-item ">
                    <a class="nav-link" id="mdfCompt" runat="server" onserverclick="mdfCompt_ServerClick">
                    <i class="fas fa-user-edit"></i>
                    <span>Modifier Compte</span></a>
                </li>

                <li class="nav-item fixed-bottom">
                    <a class="nav-link" runat="server" id="deconnexion" onserverclick="deconnexion_ServerClick1">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Déconnexion</span></a>
                </li>

           </ul>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column pt-30" >

      <!-- Main Content -->
        <div id="content ">

            <div class="container-fluid" >

                <%--Candidat--%>

                <asp:Panel ID="derDemandes" runat="server">

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Nouveaux Recute</h1>
                    </div>

                    <table class="table table-striped">
                          <asp:Repeater ID="repNvRecrute" runat="server" OnItemCommand="repNvRecrute_ItemCommand">
                              <HeaderTemplate>
                                  <thead>
                                          <tr>
                                              <th scope="col">Titre d'emploi</th>
                                              <th scope="col">Entreprise</th>
                                              <th scope="col">Date</th>
                                              <th scope="col">Reponse</th>
                                          </tr>
                                      </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                      <tbody>
                                          <tr>
                                              <td><%#Eval("Letitre")%></td>
                                              <td><%#Eval("Lenom") %> </td>
                                              <td><%#Eval("Ladate") %></td>
                                              <td>
                                                 <asp:LinkButton ID="LinkButton2" runat="server" CommandName="acceptrecrt" CommandArgument='<%#Eval("RidEmp")%>'>Accepter</asp:LinkButton>

                                              </td>
                                          </tr>
                                      </tbody>
                              </ItemTemplate>

                          </asp:Repeater>
                      </table>
                    
                    <div  class="d-sm-flex align-items-center justify-content-between mb-4 mt-60">
                        <h1 class="h3 mb-0 text-gray-800">Dernier Postulations</h1>
                    </div>

                    <table class="table table-striped">
                          <asp:Repeater ID="repDerDemandes" runat="server">
                              <HeaderTemplate>
                                  <thead>
                                          <tr>
                                              <th scope="col">Titre d'emploi</th>
                                              <th scope="col">Entreprise</th>
                                              <th scope="col">Date</th>
                                          </tr>
                                      </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                      <tbody>
                                          <tr>
                                              <td><%#Eval("Letitre")%></td>
                                              <td><%#Eval("Lenom") %> </td>
                                              <td><%#Eval("Ladate") %></td>
                                          </tr>
                                      </tbody>
                              </ItemTemplate>

                          </asp:Repeater>
                      </table>
                   <%-- demande accepter pour candiadt--%>

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4 mt-60">
                        <h1 class="h3 mb-0 text-gray-800">Demandes Accepter</h1>
                    </div>

                    <table class="table table-striped">
                          <asp:Repeater ID="DmAccepterC" runat="server">
                              <HeaderTemplate>
                                  <thead>
                                          <tr>
                                              <th scope="col">Titre d'emploi</th>
                                              <th scope="col">Entreprise</th>
                                          </tr>
                                      </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                      <tbody>
                                          <tr>
                                              <td><%#Eval("LetitreA")%></td>
                                              <td><%#Eval("LenomA") %> </td>
                                          </tr>
                                      </tbody>
                              </ItemTemplate>

                          </asp:Repeater>
                      </table>

                </asp:Panel>

                <%--Entreprise--%>

                <asp:Panel ID="nvDemandes" runat="server">

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Nouvaux Demandes</h1>
                    </div>

                    <table class="table table-striped">
                          <asp:Repeater ID="repDemande" runat="server" OnItemCommand="repDemande_ItemCommand">
                              <HeaderTemplate>
                                  <thead>
                                          <tr>
                                              <th scope="col">Titre d'emploi</th>
                                              <th scope="col">Candidat</th>
                                              <th scope="col">Date</th>
                                              <th scope="col">Reponse</th>
                                          </tr>
                                      </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                      <tbody>
                                          <tr>
                                              <td><%#Eval("Letitre")%></td>
                                              <td><%#Eval("candidatNom") %> <%#Eval("candidatP") %> </td>
                                              <td><%#Eval("Ladate") %></td>
                                              <td>
                                                  <asp:LinkButton ID="AccepterDemandc" runat="server" CommandName="accepterDem" CommandArgument='<%#Eval("rcD")%>' >Accepter</asp:LinkButton>
                                              </td>
                                          </tr>
                                      </tbody>
                              </ItemTemplate>

                          </asp:Repeater>
                      </table>
                      <%-- Proposition accepter pour Entreprise--%>

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4 mt-60">
                        <h1 class="h3 mb-0 text-gray-800">Propositions Accepter</h1>
                    </div>

                    <table class="table table-striped">
                          <asp:Repeater ID="PropA" runat="server">
                              <HeaderTemplate>
                                  <thead>
                                          <tr>
                                              <th scope="col">Titre d'emploi</th>
                                              <th scope="col">Nom Candidat</th>
                                          </tr>
                                      </thead>
                              </HeaderTemplate>
                              <ItemTemplate>
                                      <tbody>
                                          <tr>
                                               <td><%#Eval("LetitreR")%></td>
                                              <td><%#Eval("candidatNomR") %> <%#Eval("candidatPR") %> </td>
                                          </tr>
                                      </tbody>
                              </ItemTemplate>

                          </asp:Repeater>
                      </table>

                </asp:Panel>

                <asp:Panel ID="PostJob" runat="server">

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Ajouter une Emploi</h1>
                    </div>

                    <section id="Post-Etape1">
                                  <div class="container">
                                      <!-- Nav pills -->
                                      <ul class="nav nav-pills nav-justified" role="tablist">
                                          <li class="nav-item">
                                              <a class="nav-link active" role="tab" aria-controls="Etape1" aria-selected="true" onclick="slide('Post-Etape1','Post-Etape2','Post-Etape3')">Etape 1</a>
                                          </li>
                                          <li class="nav-item">
                                              <a class="nav-link" role="tab" aria-controls="Etape2" aria-selected="false" onclick="slide('Post-Etape2','Post-Etape1','Post-Etape3')">Etape 2</a>
                                          </li>
                                          <li class="nav-item">
                                              <a class="nav-link" role="tab" aria-controls="Etape3" aria-selected="false" onclick="slide('Post-Etape3','Post-Etape2','Post-Etape1')">Etape 3</a>
                                          </li>
                                      </ul>
                                      <!-- Tab panes -->
                                      <div class="tab-content py-3 px-3 px-sm-0 events-tab-content">
                                          <div class="tab-pane fade show active" id="Etape1" role="tabpanel" aria-labelledby="Etape1-tab">


                                              <div class="form-group">
                                                  <label for="contact-person" class="label label-info">Titre d Annonce</label>

                                                  <asp:TextBox ID="Titre_ann" runat="server" placeholder="Titre Annonce" class="form-control ges-form-control" required="required" autocomplete="off"></asp:TextBox>
                                                  <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator4" runat="server" ErrorMessage="titre annonce est obligatoire" ControlToValidate="Titre_ann" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                  <br />

                                              </div>

                                              <div class="form-group">
                                                  <label for="Description" class="label label-info">Description:</label>
                                                  <asp:TextBox ID="Description" runat="server" placeholder="Description" class="form-control ges-form-control" required="required" autocomplete="off" TextMode="MultiLine" ></asp:TextBox>
                                                  <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator24" runat="server" ErrorMessage="le domaine  est obligatoire" ControlToValidate="Description" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                  <br />
                                              </div>

                                              <div class="form-group">
                                                  <label class="label label-info" for="domaine">Domaine:</label>
                                                  <asp:DropDownList ID="DropDownList1" runat="server" class="form-control ges-form-control">
                                                  </asp:DropDownList>
                                                  
                                                  <br />
                                              </div>

                                              <div class="btn-check-log text-center">
                                                  <a class="btn-check-login ripple-effect" onclick="slide('Post-Etape2', 'Post-Etape3', 'Post-Etape1')">SUIVANT</a>
                                              </div>

                                          </div>
                                      </div>
                                  </div>
                              </section>


                    <section id="Post-Etape2">
                        <div class="container">
                            <!-- Nav pills -->
                            <ul class="nav nav-pills nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link " role="tab" aria-controls="Etape1" aria-selected="false" onclick="slide('Post-Etape1','Post-Etape2','Post-Etape3')">Etape 1</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" role="tab" aria-controls="Etape2" aria-selected="true" onclick="slide('Post-Etape2','Post-Etape1','Post-Etape3')">Etape 2</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" role="tab" aria-controls="Etape3" aria-selected="false" onclick="slide('Post-Etape3','Post-Etape2','Post-Etape1')">Etape 3</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content py-3 px-3 px-sm-0 events-tab-content">
                                <div class="tab-pane fade show active" id="Etape2" role="tabpanel" aria-labelledby="Etape1-tab">


                                    <div class="form-group">
                                        <label for="nb_poste" class="label label-info">Nombre de postes :</label>

                                        <asp:TextBox ID="nbPost" runat="server" placeholder="Nombre de postes " class="form-control ges-form-control" required="required" autocomplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="nbPost" ErrorMessage="Le nombre de postes demander est obligatoire" >*</asp:RequiredFieldValidator>

                                        <br />
                                        <br />

                                    </div>

                                    <div class="form-group">
                                        <label for="dateEcheance" class="label label-info">Date d echeance :</label>
                                        <asp:TextBox ID="dateEch" runat="server" class="form-control ges-form-control" required="required" autocomplete="off" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="Date d echeance obligatoire" ControlToValidate="dateEch">*</asp:RequiredFieldValidator>
                                        <br />
                                        <br />
                                    </div>

                                    <div class="form-group">
                                        <label class="label label-info">Ville:</label>
                                        <asp:TextBox ID="ville" runat="server" placeholder="Ville:" class="form-control ges-form-control" required="required" autocomplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator3" ForeColor="Red" runat="server" ErrorMessage="la ville est obligatoire" ControlToValidate="ville">*</asp:RequiredFieldValidator>

                                        <br />
                                        <br />
                                    </div>

                                    <div class="btn-check-log text-center">
                                        <a class="btn-check-login ripple-effect" onclick="slide('Post-Etape3','Post-Etape2','Post-Etape1')">suivant</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </section>


                    <section id="Post-Etape3">
                        <div class="container">
                            <!-- Nav pills -->
                            <ul class="nav nav-pills nav-justified" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link " role="tab" aria-controls="Etape1" aria-selected="false" onclick="slide('Post-Etape1','Post-Etape2','Post-Etape3')">Etape 1</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" role="tab" aria-controls="Etape2" aria-selected="false" onclick="slide('Post-Etape2','Post-Etape1','Post-Etape3')">Etape 2</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" role="tab" aria-controls="Etape3" aria-selected="true" onclick="slide('Post-Etape3','Post-Etape2','Post-Etape1')">Etape 3</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content py-3 px-3 px-sm-0 events-tab-content">
                                <div class="tab-pane fade show active" id="Etape3" role="tabpanel" aria-labelledby="Etape1-tab">
                                    <br />
                                    <br />
                                    <div class="form-group">
                                        <label for="contact-person" class="label label-info">Profession:</label>
                                        <asp:DropDownList ID="DropDownList3" runat="server" class="form-control ges-form-control">
                                        </asp:DropDownList>
                                        <br />
                                    </div>

                                    <div class="form-group">
                                        <label for="contact-person" class="label label-info">Contrat:</label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control ges-form-control">
                                        </asp:DropDownList>
                                        <br />
                                    </div>

                                    <div class="form-group">
                                        <label for="contact-email" class="label label-info">Salaire propose:</label>
                                        <asp:TextBox ID="salaire" runat="server" placeholder="0 Si negociable" class="form-control ges-form-control" autocomplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="2" ID="RequiredFieldValidator23" ForeColor="Red" runat="server" ErrorMessage="la ville est obligatoire" ControlToValidate="salaire">*</asp:RequiredFieldValidator>

                                        <br />
                                        <br />
                                    </div>


                                    <div class="btn-check-log text-center">
                                        <asp:Button ID="Button1" class="btn-check-login ripple-effect" causesvalidation="true" validationgroup="2" runat="server" Text="Poster" OnClick="Button1_Click" BackColor="AliceBlue" />
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </section>



                    <script>
                        document.getElementById('Post-Etape2').hidden = true;
                        document.getElementById('Post-Etape3').hidden = true;
                        function slide(id1, id2, id3) {
                            document.getElementById(id1).hidden = false;
                            document.getElementById(id2).hidden = true;
                            document.getElementById(id3).hidden = true;
                        }

                    </script>

                </asp:Panel>

                <asp:Panel ID="mesEmplois" runat="server">

                    <div  class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Mes Emplois</h1>
                    </div>

                    <div class="job-listing-area pt-50 pb-120">
                              <div class="container-fluid">
                                  <div class="row">
                                      <div class="col-xl-9 col-lg-9 col-md-8">

                                          <section class="featured-job-area">
                                              <div class="container">

                                                  <asp:Repeater ID="repEmplois" runat="server" OnItemCommand="repEmplois_ItemCommand">
                                                      <ItemTemplate>

                                                          <div class="single-job-items mb-30">
                                                              <div class="job-items">
                                                                  <div class="company-img">
                                                                      <a href="#">
                                                                          <img src="/Logo_Entreprise/<%#Eval("logo")%>" alt=""></a>
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
                                                                  <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-area" CommandName="btnEmp" CommandArgument='<%#Eval("idEmploi")%>'>Modifier</asp:LinkButton>
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

                </asp:Panel>

                <div id="UpdateEmp" runat="server">
                    <div class="container" >
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txttitre">Titre</label>
                                <asp:TextBox ID="txttitre" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="titre de Emploi est Obligatoire" ValidationGroup="5" ControlToValidate="txttitre" CssClass="valErreur" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="txtvilleemp">Ville</label>
                                <asp:TextBox ID="txtvilleemp" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="La ville de Emploi est Obligatoire" ValidationGroup="5" ControlToValidate="txtvilleemp" CssClass="valErreur" />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtnbpost">Nombre Postes</label>
                                <asp:TextBox ID="txtnbpost" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Nb Post de Emploi est Obligatoire" ValidationGroup="5" ControlToValidate="txtnbpost" CssClass="valErreur" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="txtdateechan">Date Echeance</label>
                                <asp:TextBox ID="txtdateechan" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="La Date de Emploi est Obligatoire" ValidationGroup="5" ControlToValidate="txtdateechan" CssClass="valErreur" />
                            </div>
                            <div class="form-group col-md-6">
                                <label for="txtsalaire">Salaire</label>
                                <asp:TextBox ID="txtsalaire" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Saliare de Emploi est Obligatoire" ValidationGroup="5" ControlToValidate="txtsalaire" CssClass="valErreur" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="txtDescriptionemp">Description</label>
                                <asp:TextBox ID="txtDescriptionemp" runat="server" CssClass="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Description de Emploi est Obligatoire" ValidationGroup="3" ControlToValidate="txtDescriptionemp" CssClass="valErreur" />
                            </div>
                        </div>
                        <div class="row">

                            <div class="form-group col-md-6">
                                <a class="btn-check-login ripple-effect" runat="server" id="btn_update_emp" onserverclick="btn_update_emp_ServerClick">Modifier</a>
                            </div>
                            <div class="form-group col-md-6">
                                <a class="btn-check-login ripple-effect" runat="server" id="btn_annuler_emp" onserverclick="btn_annuler_emp_ServerClick">Annuler</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%--All--%>

                <asp:Panel ID="modifierCompte" runat="server">

                    <asp:Panel ID="modCand" runat="server">
                        <div class="container">
                    
                                    <div class="row">

                                        <div class="form-group col-md-6">
                                            <label for="photoUp">Photo</label>
                                            <asp:FileUpload ID="photoUp" class="form-control-file" runat="server" />
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="cvUp">C.V</label>
                                            <asp:FileUpload ID="cvUp" class="form-control-file" runat="server" />
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label for="txtNom">Nom</label>
                                            <asp:TextBox ID="txtNom" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="A" runat="server" ErrorMessage="Nom est Obligatoire" ForeColor="Red" ControlToValidate="txtNom" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="txtPrenom">Prenom</label>
                                            <asp:TextBox ID="txtPrenom" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" ValidationGroup="A" runat="server" ErrorMessage="Prénom est Obligatoire" ForeColor="Red" ControlToValidate="txtPrenom" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="txtDate">Date Naissance</label>
                                            <asp:TextBox ID="txtDate" TextMode="Date" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" ValidationGroup="A" runat="server" ErrorMessage="Date de Naissance est Obligatoire" ForeColor="Red" ControlToValidate="txtDate" CssClass="valErreur">*</asp:RequiredFieldValidator>
                
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="txtVille">Ville</label>
                                            <asp:TextBox ID="txtVille" runat="server" CssClass="form-control" ></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator27" ValidationGroup="A" runat="server" ErrorMessage="Ville  est Obligatoire" ForeColor="Red" ControlToValidate="txtVille" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="txtTel">Telephone</label>
                                            <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" ></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="A" runat="server" ErrorMessage="Telephonne  est Obligatoire" ForeColor="Red" ControlToValidate="txtTel" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="form-group col-md-6">
                                            <label for="dlNiveau">Niveau d'etude</label>
                                            <asp:DropDownList ID="dlNiveau" runat="server" CssClass="form-control"></asp:DropDownList>
                                           </div>

                                         <div class="form-group col-md-6">
                                            <label for="txtDiplome">Diplome</label>
                                             <asp:TextBox ID="diptxt" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="A" runat="server" ErrorMessage="Votre Diplome  est Obligatoire" ForeColor="Red" ControlToValidate="diptxt" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="form-group col-md-6">
                                            <label for="txtProf">Profession</label>
                                            <asp:TextBox ID="txtProf" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="A" runat="server" ErrorMessage="Profession est Obligatoire" ForeColor="Red"  ControlToValidate="txtProf" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label for="txtExp">Expérience</label>
                                            <asp:TextBox ID="txtExp" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="A" runat="server" ErrorMessage="Experience Année est Obligatoire" ForeColor="Red" ControlToValidate="txtExp" CssClass="valErreur">*</asp:RequiredFieldValidator>
                         
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="txtProfil">Profil</label>
                                            <asp:TextBox ID="txtProfil" runat="server" CssClass="form-control" Rows="10" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="A" runat="server" ErrorMessage="Votre Profil  est Obligatoire" ForeColor="Red" ControlToValidate="txtProfil" CssClass="valErreur">*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                   
                                    <div class="row mb-20">
                                       
                                        <div class="btn-check-log text-center col-md-6">
                                            <a class="btn-check-login ripple-effect" runat="server" id="ModifierCan" causesvalidation="true" validationgroup="A" onserverclick="ModifierCan_ServerClick">Modifier</a>
                                             </div>
                                        <div class="btn-check-log text-center col-md-6">
                                            <a class="btn-check-login ripple-effect" runat="server" id="annuler" onserverclick="annuler_ServerClick">Annuler</a>
                                        </div>

                                    </div>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="modEntr" runat="server">
                        <div class="container">
                          
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="logoUp">LOGO</label>
                                            <asp:FileUpload ID="logoUp" class="form-control-file form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6"> 
                                            <label for="txtNomEnt">Nom Entreprise </label>
                                            <asp:TextBox ID="txtNomEnt" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Nom Entreprise est Obligatoire" ValidationGroup="4" ControlToValidate="txtNomEnt" ForeColor="Red" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group col-md-6"> 
                                            <label for="txtNom">Ville </label>
                                           
                                            <asp:TextBox ID="txtVilleEnt" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Ville Entreprise est Obligatoir" ValidationGroup="4" ControlToValidate="txtVilleEnt" ForeColor="Red" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-6"> 
                                            <label for="txtadresseEnt">Adresse </label>
                                            <asp:TextBox ID="txtadresseEnt" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Adresse de Entreprise est Obligatoire" ValidationGroup="4" ForeColor="Red" ControlToValidate="txtadresseEnt" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>
                                       <div class="form-group col-md-6">
                                            <label for="txtDateEnt">Date Creation</label>
                                            <asp:TextBox ID="txtDateEnt" TextMode="Date" runat="server" CssClass="form-control" ></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="4" ForeColor="Red" ErrorMessage="Date de Creation est Obligatoire" ControlToValidate="txtDateEnt" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                             <label for="txtDescription">Description</label>
                                           
                                            <asp:TextBox ID="txtDescription" runat="server"  CssClass="form-control"  Rows="10" TextMode="MultiLine"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="4" ErrorMessage="Description de Entreprise est Obligatoire" ForeColor="Red"  ControlToValidate="txtDescription" CssClass="valErreur" >*</asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                       
                                        <div class="form-group col-md-6">
                                             <a class="btn-check-login ripple-effect" causesvalidation="true" validationgroup="4" runat="server" id="ModifierEnt" onserverclick="ModifierEnt_ServerClick">Modifier</a>
                                        </div>
                                         <div class="form-group col-md-6">
                                             <a class="btn-check-login ripple-effect" runat="server" id="annulerEnt" onserverclick="Listjob_ServerClick">Annuler</a>
                                        </div>
                                    </div>

                        </div>
                    </asp:Panel>
                    
                </asp:Panel>
                
            </div>

        </div>

        </div>
    </div>


</form>
</body>

    <script src="/Scripts/jquery-3.3.1.min.js"></script>
    <script src="/Scripts/popper.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>

    <script src="/Scripts/sb-admin-2.js"></script>

<script src="/Scripts/keywords.js"></script>
</html>
