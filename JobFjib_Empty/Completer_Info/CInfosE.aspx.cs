using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty
{
    public partial class CInfosE : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Completez_ServerClick(object sender, EventArgs e)
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
                    En.logo = "User.png";
                }
                else
                {
                    string filup = Path.GetFileName(logoUp.PostedFile.FileName);
                    logoUp.SaveAs(Server.MapPath("~/Logo_Entreprise/") + filup);
                    En.logo = filup;
                }

            }

            En.nom = txtNom.Value;
            En.ville = txtVille.Value;
            En.adresse = txtAdresse.Value;
            En.anneeCreation = DateTime.Parse(txtDate.Value);
            En.description = txtdescription.Value;

            db.SubmitChanges();
            Response.Redirect("~/Home.aspx");
           
        }
    }
}