using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty.Emp
{
    public partial class emplois : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();


        bool vil = false, dom = false, cnt = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            //var domainds = from x in db.Domaines select x;

            if (!IsPostBack)
            {
                var domains = db.Emploi.Select(m => new { m.domain }).GroupBy(x => x.domain).Select(x => x.First()).ToList();

                dlDomain.DataTextField = "domain";
                dlDomain.DataValueField = "domain";
                dlDomain.DataSource = domains;
                dlDomain.DataBind();
                dlDomain.Items.Insert(0, new ListItem("Tout les Domaines"));

                var location = db.Emploi.Select(m => new { m.ville }).GroupBy(x => x.ville).Select(x => x.First()).ToList();


                dlVille.DataTextField = "ville";


                dlVille.DataSource = location;
                dlVille.DataBind();
                dlVille.Items.Insert(0, new ListItem("Tout les Villes", "0"));


                var contart = db.Contrat.ToList();


                dlContrat.DataTextField = "designation";
                dlContrat.DataValueField = "IdContrat";



                dlContrat.DataSource = contart;
                dlContrat.DataBind();
                dlContrat.Items.Insert(0, new ListItem("Tout les Contrat", "0"));

                var emps = db.Emploi.Select(x => new { x.dateCreation, profession = x.Profession.designation, x.idEmploi, x.Entreprise.logo, x.ville, x.Salaire, Nom = x.Entreprise.nom })
                .OrderByDescending(r => r.idEmploi);

                repEmplois.DataSource = emps.ToList();
                repEmplois.DataBind();
            }




        }
        protected void repEmplois_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnEmp")
            {
                Session["IdEmp"] = e.CommandArgument.ToString();
                Response.Redirect("~/Emp/emploi.aspx");
            }
        }

        protected void dlVille_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlVille.SelectedIndex != 0)
            {
                vil = true;
            }
        }

        protected void dlContrat_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlContrat.SelectedIndex != 0)
            {
                cnt = true;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            var emps = db.Emploi.Select(x => new { x.dateCreation, profession = x.Profession.designation, x.idEmploi, x.Entreprise.logo, x.ville, x.Salaire, x.IdContrat, x.domain, Nom = x.Entreprise.nom })
              ;


            if (dom && vil && cnt)
            {
                emps = from d in emps
                       where d.domain == dlDomain.SelectedItem.ToString()
                       join
                        v in emps
                        on
                        d.idEmploi equals v.idEmploi
                       where v.ville == dlVille.SelectedItem.ToString()
                       join
                        c in emps on
                        d.idEmploi equals c.idEmploi
                       where c.IdContrat == Convert.ToInt32(dlContrat.SelectedValue)
                       select d;
            }
            else
            {
                if (!dom || !vil || !cnt)
                {

                    if (dom == true) { emps = emps.Where(d => d.domain == dlDomain.SelectedItem.ToString()); dom = false; }
                    if (vil == true) { emps = emps.Where(p => p.ville == dlVille.SelectedItem.ToString()); vil = false; }
                    if (cnt == true) { emps = emps.Where(c => c.IdContrat == Convert.ToInt32(dlContrat.SelectedValue)); cnt = false; }
                }
            }
            repEmplois.DataSource = emps.ToList();
            repEmplois.DataBind();
            dlContrat.SelectedIndex = 0;
            dlVille.SelectedIndex = 0;
            dlDomain.SelectedIndex = 0;


        }

        protected void dlDomain_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dlDomain.SelectedIndex != 0)
            {
                dom = true;
            }


        }

    }
}