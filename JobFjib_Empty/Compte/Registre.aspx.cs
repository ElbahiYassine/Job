using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace JobFjib_Empty.Compte
{
    public partial class Registre : System.Web.UI.Page
    {
       
        jobContextDataContext db = new jobContextDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInscription_Click(object sender, EventArgs e)
        {
            
            var user = db.Utilisateur.SingleOrDefault(x => x.email == txtEmail.Text);

            if (user == null)
            {
                Utilisateur u = new Utilisateur();
                u.email = txtEmail.Text;
                u.mdp = Eramake.eCryptography.Encrypt(txtMdp.Text);
                u.typeUser = UserType.Text;
                u.dernierVisite = Convert.ToDateTime(DateTime.Now.ToShortTimeString());
                db.Utilisateur.InsertOnSubmit(u);
                db.SubmitChanges();

                Session["idUser"] = u.idUser;

                if (UserType.SelectedIndex == 0)
                {
                    Candidat c = new Candidat();
                    c.candidatId = u.idUser;
                    c.dateNaissance = DateTime.Now;
                    db.Candidat.InsertOnSubmit(c);
                    db.SubmitChanges();

                    Session["UserType"] = "candidat";

                    Response.Redirect("~/Completer_Info/CInfosC.aspx");
                }
                else if (UserType.SelectedIndex == 1)
                {
                    Entreprise en = new Entreprise();
                    en.idEntreprise = u.idUser;
                    en.anneeCreation = DateTime.Now;
                    db.Entreprise.InsertOnSubmit(en);
                    db.SubmitChanges();

                    Session["UserType"] = "entreprise";

                    Response.Redirect("~/Completer_Info/CInfosE.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "emailExist", "emailExist()", true);
            }
        }
    }
}