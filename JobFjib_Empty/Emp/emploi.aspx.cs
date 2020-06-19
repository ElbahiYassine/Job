using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty.Emp
{
    public partial class emploi : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            //var emp = from x in db.Emplois.Where(y => y.idEmploi == 3 ) Select x;
            int id = int.Parse(Session["IdEmp"].ToString());

            var emp = db.Emploi.Where(x => x.idEmploi == id).ToList();

            repEmploi.DataSource = emp;
            repEmploi.DataBind();
        }

        protected void btnPostuler_ServerClick(object sender, EventArgs e)
        {
            int idEmp = int.Parse(Session["IdEmp"].ToString());
            int idUser = int.Parse(Session["idUser"].ToString());

            Recrute r = new Recrute();

            r.Candidat_candidatId = idUser;
            r.date = Convert.ToDateTime(DateTime.Now.ToShortTimeString());
            r.lettreMtv = txtLettre.Text;
            r.Emploi_idEmploi = idEmp;
            r.Categorie = "Demande";
            r.etatRec = "Dans attent d un reponce";

            db.Recrute.InsertOnSubmit(r);

            db.SubmitChanges();

            Response.Redirect("~/Emp/emplois.aspx");



        }
    }
}