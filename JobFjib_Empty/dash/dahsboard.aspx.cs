using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty.dash
{
    public partial class dahsboard : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();
        //int idEmpoi_Cand_accept;

        public void RemplirCombos()
        {
            //ComboBox Domaines
            var dm = from d in db.Domaine
                     select d;
            DropDownList1.DataSource = dm;
            DropDownList1.DataTextField = "Designation";
            DropDownList1.DataValueField = "IdDomaine";
            DropDownList1.DataBind();

            //ComboBox Contrats
            var ct = from d in db.Contrat
                     select d;
            DropDownList2.DataSource = ct;
            DropDownList2.DataTextField = "Designation";
            DropDownList2.DataValueField = "IdContrat";
            DropDownList2.DataBind();

            //ComboBox Professions
            var pr = from p in db.Profession
                     select p;
            DropDownList3.DataSource = pr;
            DropDownList3.DataTextField = "designation";
            DropDownList3.DataValueField = "IdProfession";
            DropDownList3.DataBind();


            //ComboBox Niveau D'etude
            var niveau = from y in db.NiveauEtude select y;

            dlNiveau.DataSource = niveau;
            dlNiveau.DataTextField = "designation";
            dlNiveau.DataValueField = "IdNiveau";
            dlNiveau.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RemplirCombos();

                int id = int.Parse(Session["idUser"].ToString());

                //Candidat Section
                if (Session["UserType"].ToString() == "candidat")
                {
                    itemEntrprise.Visible = false;

                    derDemandes.Visible = true;

                    nvDemandes.Visible = false;
                    PostJob.Visible = false;
                    mesEmplois.Visible = false;
                    UpdateEmp.Visible = false;
                    modifierCompte.Visible = false;
                    //demande
                    var nvDem = db.Recrute.Where(y => y.Candidat_candidatId == id && y.Categorie == "Demande" && y.etatRec != "Accepter").Select(x => new
                    {
                        Letitre = x.Emploi.titre,
                        Ladate = x.date,
                        Lenom = x.Emploi.Entreprise.nom
                    });

                    repDerDemandes.DataSource = nvDem;
                    repDerDemandes.DataBind();

                    var nvRe = db.Recrute.Where(y => y.Candidat_candidatId == id && y.Categorie == "Recrute" && y.etatRec != "Accepter").Select(x => new
                    {
                        Letitre = x.Emploi.titre,
                        Ladate = x.date,
                        Lenom = x.Emploi.Entreprise.nom,
                        RidEmp = x.RecruteId
                    });

                    repNvRecrute.DataSource = nvRe;
                    repNvRecrute.DataBind();


                    //Demande accepter pour candidat
                    var Demacc = db.Recrute.Where(y => y.Candidat_candidatId == id && y.Categorie == "Demande" && y.etatRec == "Accepter").Select(x => new
                    {
                        LetitreA = x.Emploi.titre,
                        LenomA = x.Emploi.Entreprise.nom
                    });
                    DmAccepterC.DataSource = Demacc;
                    DmAccepterC.DataBind();

                }

                //Entreprise Section
                if (Session["UserType"].ToString() == "entreprise")
                {
                    itemEntrprise.Visible = true;

                    nvDemandes.Visible = true;

                    derDemandes.Visible = false;
                    PostJob.Visible = false;
                    mesEmplois.Visible = false;
                    UpdateEmp.Visible = false;
                    modifierCompte.Visible = false;

                    var re = db.Recrute.Where(y => y.Emploi.idEntreprise == id && y.Categorie == "Demande" && y.etatRec != "Accepter").Select(x => new
                    {
                        Letitre = x.Emploi.titre,
                        Ladate = x.date,
                        candidatNom = x.Candidat.nom,
                        candidatP = x.Candidat.prenom,
                        rcD = x.RecruteId
                    });

                    repDemande.DataSource = re;
                    repDemande.DataBind();



                    //Propositions d emplois accepter
                    var recpA = db.Recrute.Where(y => y.Emploi.idEntreprise == id && y.Categorie == "recrute" && y.etatRec == "Accepter").Select(x => new
                    {
                        LetitreR = x.Emploi.titre,
                        candidatNomR = x.Candidat.nom,
                        candidatPR = x.Candidat.prenom,
                    });
                    PropA.DataSource = recpA;
                    PropA.DataBind();
                }




                if (!IsPostBack)
                {
                    if (Session["UserType"].ToString() == "entreprise")
                    {
                        //Modifier Compte Entreprise
                        Entreprise entreprise = db.Entreprise.Where(x => x.idEntreprise == id).First();

                        txtNomEnt.Text = entreprise.nom;
                        txtVilleEnt.Text = entreprise.ville;
                        txtadresseEnt.Text = entreprise.adresse;
                        txtDateEnt.Text = entreprise.anneeCreation.ToString("yyyy-MM-dd");
                        txtDescription.Text = entreprise.description;
                       

                    }
                    else
                    {
                        //Modifier Compte Candidat
                        Candidat candidat = db.Candidat.Where(x => x.candidatId == id).First();

                        txtNom.Text = candidat.nom;
                        txtPrenom.Text = candidat.prenom;
                        txtDate.Text =candidat.dateNaissance.ToString("yyyy-MM-dd");
                        txtVille.Text = candidat.ville;
                        txtTel.Text = candidat.tel;
                        txtProf.Text = candidat.Profession;
                        txtExp.Text = candidat.experience.ToString();
                        txtProfil.Text = candidat.profil;
                        txtDiplome.Text = candidat.Diplom;

                    }


                }


                ////Modifier Compte Entreprise
                //var ent = db.Entreprises.Where(x => x.idEntreprise == id).Select(y => new
                //{
                //    nomEntr = y.nom,
                //    villeEntr = y.ville,
                //    AdresseEntr = y.adresse,
                //    DateEnt = y.anneeCreation,
                //    Description = y.description,
                //});
            }

        }

        public void reset(Control control)
        {
            foreach (Control x in control.Controls)
            {
                if (x is TextBox)
                {
                    (x as TextBox).Text = String.Empty;
                }

                if (x is DropDownList)
                {
                    (x as DropDownList).SelectedIndex = 0;
                }

                reset(x);
            }

        }


        protected void repEmplois_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnEmp")
            {
                Session["IdEmp"] = e.CommandArgument.ToString();

                UpdateEmp.Visible = true;

                derDemandes.Visible = false;
                nvDemandes.Visible = false;
                PostJob.Visible = false;
                mesEmplois.Visible = false;
                modifierCompte.Visible = false;

                int id = int.Parse(Session["IdEmp"].ToString());
                int idus = int.Parse(Session["idUser"].ToString());


                Emploi emps = db.Emploi.Where(w => w.idEmploi == id && w.idEntreprise == idus).First();
                txttitre.Text = emps.titre;
                txtvilleemp.Text = emps.ville;
                txtnbpost.Text = emps.nbPostes.ToString();
                txtdateechan.Text = emps.dateEcheance.ToString("yyyy-MM-dd");
                txtsalaire.Text = emps.Salaire.ToString();
                txtDescriptionemp.Text = emps.descrip;



            }
        }

        //Entreprise

        protected void Listjob_ServerClick(object sender, EventArgs e)
        {
            mesEmplois.Visible = true;

            derDemandes.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            modifierCompte.Visible = false;
            UpdateEmp.Visible = false;

            int i = int.Parse(Session["idUser"].ToString());

            var emps = db.Emploi.Where(y => y.idEntreprise == i).Select(x => new { x.dateCreation, profession = x.Profession.designation, x.idEmploi, x.Entreprise.logo, x.ville, x.Salaire, Nom = x.Entreprise.nom })
                .OrderByDescending(r => r.idEmploi);

            repEmplois.DataSource = emps.ToList();
            repEmplois.DataBind();
        }

        protected void Post_Job_ServerClick(object sender, EventArgs e)
        {
            PostJob.Visible = true;

            nvDemandes.Visible = false;
            derDemandes.Visible = false;
            mesEmplois.Visible = false;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }

        //Modifier Emplois
        protected void Button1_Click(object sender, EventArgs e)
        {
            Emploi ep = new Emploi();
            ep.dateCreation = DateTime.Now;
            ep.titre = Titre_ann.Text;
            ep.descrip = Description.Text;
            ep.domain = DropDownList1.SelectedItem.ToString();
            ep.ville = ville.Text;
            ep.nbPostes = int.Parse(nbPost.Text);
            ep.IdContrat = int.Parse(DropDownList2.SelectedValue);
            ep.IdProfession = int.Parse(DropDownList3.SelectedValue);
            ep.Salaire = float.Parse(salaire.Text);
            ep.idEntreprise = int.Parse(Session["idUser"].ToString()); ;
            ep.dateEcheance = DateTime.Parse(dateEch.Text);
            ep.emploiEtat = true;
            db.Emploi.InsertOnSubmit(ep);
            db.SubmitChanges();

            reset(this);

            Listjob_ServerClick(sender,e);
        }

        //Candidat

        protected void emplPostuler_ServerClick(object sender, EventArgs e)
        {
            derDemandes.Visible = true;

            nvDemandes.Visible = false;
            PostJob.Visible = false;
            mesEmplois.Visible = false;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }

        //All

        protected void dashHome_ServerClick(object sender, EventArgs e)
        {
            //Candidat Section
            if (Session["UserType"].ToString() == "candidat")
            {
                derDemandes.Visible = true;

                nvDemandes.Visible = false;
                PostJob.Visible = false;
                mesEmplois.Visible = false;
                UpdateEmp.Visible = false;
                modifierCompte.Visible = false;
            }


            //Entreprise Section
            if (Session["UserType"].ToString() == "entreprise")
            {
                nvDemandes.Visible = true;

                derDemandes.Visible = false;
                PostJob.Visible = false;
                mesEmplois.Visible = false;
                UpdateEmp.Visible = false;
                modifierCompte.Visible = false;
            }
        }

        protected void mdfCompt_ServerClick(object sender, EventArgs e)
        {
            modifierCompte.Visible = true;

            derDemandes.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            mesEmplois.Visible = false;
            UpdateEmp.Visible = false;

            if (Session["UserType"].ToString() == "candidat")
            {
                modCand.Visible = true;
                modEntr.Visible = false;
            }
            else if (Session["UserType"].ToString() == "entreprise")
            {
                modCand.Visible = false;
                modEntr.Visible = true;
            }

        }

        protected void deconnexion_ServerClick1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Home.aspx");
        }

        protected void annuler_ServerClick(object sender, EventArgs e)
        {
            derDemandes.Visible = true;

            itemEntrprise.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            mesEmplois.Visible = false;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }
        //Modifier Candidat info
        protected void ModifierCan_ServerClick(object sender, EventArgs e)
        {
            int id = int.Parse(Session["idUser"].ToString());

            Candidat cd = db.Candidat.Where(x => x.candidatId == id).First();

            if (photoUp.PostedFile != null)
            {
                string strPath = Path.GetExtension(photoUp.PostedFile.FileName);
                strPath = strPath.ToLower();
                if (strPath != ".jpg" && strPath != ".jpeg" && strPath != ".gif" && strPath != ".png")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "ImageAlert", "ImageInvalide()", true);
                }
                else
                {
                    string filup = Path.GetFileName(photoUp.PostedFile.FileName);
                    photoUp.SaveAs(Server.MapPath("/UserImages/") + filup);
                    cd.photo = filup;
                }
            }

            if (cvUp.PostedFile != null)
            {
                string strPath2 = Path.GetExtension(cvUp.PostedFile.FileName);

                if (strPath2 != ".pdf" && strPath2 != ".doc" && strPath2 != ".docx" && strPath2 != ".txt" && strPath2 != ".ppt")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "CVAlert", "CVInvalide()", true);
                }
                else
                {
                    string filup = Path.GetFileName(cvUp.PostedFile.FileName);
                    cvUp.SaveAs(Server.MapPath("/CandidatCV/") + filup);
                    cd.cv = "/CandidatCV/" + filup;
                }
            }

            cd.nom = txtNom.Text;
            cd.prenom = txtPrenom.Text;
            cd.dateNaissance = DateTime.Parse(txtDate.Text).Date;
            cd.ville = txtVille.Text;
            cd.profil = txtProfil.Text;
            cd.experience = int.Parse(txtExp.Text);
            cd.tel = txtTel.Text;
            cd.Profession = txtProf.Text;
            cd.NiveauEtude_IdNiveau = int.Parse(dlNiveau.SelectedValue);
            cd.Diplom = txtDiplome.Text;

            db.SubmitChanges();

            Response.Redirect("~/Home.aspx");


        }
        //Modifier Entreprise info
        protected void ModifierEnt_ServerClick(object sender, EventArgs e)
        {
            int id = int.Parse(Session["idUser"].ToString());
            Entreprise En = db.Entreprise.SingleOrDefault(x => x.idEntreprise == id);

            if (logoUp.PostedFile != null)
            {
                string strPath = Path.GetExtension(logoUp.PostedFile.FileName);
                strPath = strPath.ToLower();
                if (strPath != ".jpg" && strPath != ".jpeg" && strPath != ".gif" && strPath != ".png")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "erreurAlert", "loginalert()", true);
                    Response.Write("only image");
                }
                else
                {
                    string filup = Path.GetFileName(logoUp.PostedFile.FileName);
                    logoUp.SaveAs(Server.MapPath("~/Logo_Entreprise/") + filup);
                    En.logo = filup;
                }

            }
            En.nom = txtNomEnt.Text;
            En.ville = txtVilleEnt.Text;
            En.adresse = txtadresseEnt.Text;
            En.anneeCreation = DateTime.Parse(txtDateEnt.Text).Date;
            En.description = txtDescription.Text;

            db.SubmitChanges();
            Response.Redirect("~/Home.aspx");
        }

        protected void annulerEnt_ServerClick(object sender, EventArgs e)
        {
            derDemandes.Visible = false;

            itemEntrprise.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            mesEmplois.Visible = true;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }
        protected void btn_update_emp_ServerClick(object sender, EventArgs e)
        {
            int id = int.Parse(Session["IdEmp"].ToString());
            Emploi emps = db.Emploi.SingleOrDefault(x => x.idEmploi == id);
            emps.titre = txttitre.Text;
            emps.ville = txtvilleemp.Text;
            emps.nbPostes = int.Parse(txtnbpost.Text);
            emps.dateEcheance = DateTime.Parse(txtdateechan.Text).Date;
            emps.Salaire = double.Parse(txtsalaire.Text);
            emps.descrip = txtDescriptionemp.Text;

            db.SubmitChanges();

            reset(this);

            mesEmplois.Visible = true;

            derDemandes.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }
        protected void btn_annuler_emp_ServerClick(object sender, EventArgs e)
        {
            mesEmplois.Visible = true;

            derDemandes.Visible = false;
            nvDemandes.Visible = false;
            PostJob.Visible = false;
            UpdateEmp.Visible = false;
            modifierCompte.Visible = false;
        }


        protected void repNvRecrute_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "acceptrecrt")
            {

                int idRec = int.Parse(e.CommandArgument.ToString());
                Recrute rec = db.Recrute.Single(y => y.RecruteId == idRec);

                if (rec != null)
                {
                    rec.etatRec = "Accepter";

                    rec.lettreMtv = "none";

                    db.SubmitChanges();
                    Response.Redirect("~/dash/dahsboard.aspx");
                }


            }
            else
            {
                Response.Write("none");
            }
        }

        protected void repDemande_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "accepterDem")
            {

                int idRec = int.Parse(e.CommandArgument.ToString());
                Recrute rec = db.Recrute.Single(y => y.RecruteId == idRec);

                if (rec != null)
                {
                    rec.etatRec = "Accepter";

                    db.SubmitChanges();
                    Response.Redirect("~/dash/dahsboard.aspx");
                }


            }
            else
            {
                Response.Write("none");
            }
        }
    }
}