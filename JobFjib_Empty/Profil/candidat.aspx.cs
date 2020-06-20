using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobFjib_Empty.Profil
{
    public partial class candidat : System.Web.UI.Page
    {
        jobContextDataContext db = new jobContextDataContext();

        
        Candidat c;
        int id, ident;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            id = int.Parse(Session["IdCan"].ToString());

            if (Session["idUser"]!=null)
            {
                 ident = int.Parse(Session["idUser"].ToString());
            }
            var joinedResult = from y in db.Candidat
                               join n in db.NiveauEtude 
                               on y.NiveauEtude_IdNiveau equals n.IdNiveau
                               where y.candidatId==id
                               select new
                               {
                                   y.candidatId,
                                   y.nom,
                                   y.prenom,
                                   y.photo,
                                   y.dateNaissance,
                                   y.ville,
                                   y.tel,
                                   y.experience,
                                   y.cv,
                                   y.profil,
                                   y.Profession,
                                   nvv =n.designation
                               };




           
              DataList1.DataSource = joinedResult;

                DataList1.DataBind();

                var ep = db.Emploi.Where(y => y.idEntreprise == ident).Select(y => new { y.titre, y.idEmploi });
                
                dlEmplois.DataTextField = "titre";
                dlEmplois.DataValueField = "idEmploi";
            dlEmplois.DataSource = ep;
            dlEmplois.DataBind();
            

            //if (! IsPostBack)
            //{
            //    if (Session["idUesr"] != null)
            //    {
            //        if (Session["UserType"].ToString() == "entreprise")
            //        {
            //            pourEntreprise.Visible = true;
            //            //Emplois d'Entreprise
            //            var empls = db.Emplois.Where(x => x.idEntreprise == id);
            //        }
            //        else
            //        {
            //            pourEntreprise.Visible = false;
            //        }
            //    }
            //    else
            //    {
            //        Response.Redirect("~/Compte/Login.aspx");
            //    }
            //}

        }

        protected void btnPostuler_ServerClick(object sender, EventArgs e)
        {
            Recrute rc = new Recrute();

            rc.date = DateTime.Now;
            rc.Candidat_candidatId = id;
            rc.Categorie = "recrute";
            rc.Emploi_idEmploi = int.Parse(dlEmplois.SelectedValue);
            rc.etatRec = "Propostion";
            rc.lettreMtv = "none";
            db.Recrute.InsertOnSubmit(rc);
            db.SubmitChanges();
        }

        protected void btnCv_Click(object sender, EventArgs e)
        {
          
            var cv = db.Candidat.Where(x => x.candidatId == 2014).Select(x => new { x.cv }).First();
            string path2 = Server.MapPath(cv.cv);
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(path2);

            if (buffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }

    }
}