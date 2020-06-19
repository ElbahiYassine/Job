using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty
{
    public partial class Home : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //da = new SqlDataAdapter("select top 4 name,picture,dateRg from persData order by id asc", con);
            //da.Fill(ds, "repeater");
            //Repeater1.DataSource = ds.Tables["repeater"];
            //Repeater1.DataBind();

            //repEmplois

            //var emps = (from x in db.Emplois select x).Take(4);.

            var emps = db.Emploi.Select(x => new { x.titre, x.descrip, x.dateEcheance, profession = x.Profession.designation, x.idEmploi, x.Entreprise.logo, x.ville,x.Salaire}).OrderByDescending(r=> r.idEmploi).Take(4);


            //db.Table1.Select(x => new { x.name, x.rank }).ToList(); 

            repEmplois.DataSource = emps.ToList();
            repEmplois.DataBind();

            var candidats = db.Candidat.Select(y => new { y.photo, y.nom, y.prenom, y.profil, y.Profession, y.candidatId,y.ville}).OrderByDescending(r => r.candidatId).Take(4);

            reCandidats.DataSource = candidats;
            reCandidats.DataBind();

        }

        protected void repEmplois_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnEmp")
            {
                Session["IdEmp"] = e.CommandArgument.ToString();
                Response.Redirect("~/Emp/emploi.aspx");
            }
        }

        protected void reCandidats_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnCan")
            {
                Session["IdCan"] = e.CommandArgument.ToString();
                Response.Redirect("~/Profil/candidat.aspx");
            }
        }
    }
}
