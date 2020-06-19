using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace JobFjib_Empty.Compte
{
    public partial class Login : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string mdp = Eramake.eCryptography.Encrypt(txtMdp.Text);
            var user = db.Utilisateur.SingleOrDefault(x => x.email == txtEmail.Text && x.mdp== mdp);      
            if (user==null)
            {
               ClientScript.RegisterStartupScript(this.GetType(), "erreurAlert", "loginalert()", true);     
            }
            else
            {

                //Utilisateur Utl = user;
                //Utl.dernierVisite = Convert.ToDateTime(DateTime.Now.ToShortTimeString());
                //db.SubmitChanges();
                if (user.typeUser == "candidat")
                {
                    var C = db.Candidat.Where(x => x.candidatId == user.idUser).First();
                    Session["UserType"] = user.typeUser;
                    Session["idUser"] = user.idUser;

                    if (Session["IdEmp"]!=null)
                    {
                        Response.Redirect("/Emp/emploi.aspx");
                    }
                    else
                    {
                        Response.Redirect("../Home.aspx");
                    }
                   
                }
                else if(user.typeUser == "entreprise")
                {
                    Session["UserType"] = user.typeUser;
                    var E = db.Entreprise.Where(x => x.idEntreprise == user.idUser).First();
                    Session["idUser"] = user.idUser;
                    Response.Redirect("~/Home.aspx");
                }
            }
        }
    }
}