using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.BP_Portal
{
    public partial class BP_Portal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["access_type_id"].ToString() == "2")
            //{
            //    lblShowUser.Text = Session["company_name"].ToString();
            //    imgCompanyLogo.ImageUrl = "../../Files/img/" + Session["company_logo"].ToString();

            //}

            ViewProfileBP();
        }

        void ViewProfileBP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT company_name, company_logo FROM business_access WHERE b_access_id=@BID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@BID", Session["b_access_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblShowUser.Text = dr["company_name"].ToString();
                                imgCompanyLogo.ImageUrl = "../../Files/img/" + dr["company_logo"].ToString();

                            }
                        }
                    }
                }
            }
        }


        protected void Logoutclick(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Default.aspx");
        }


    }
}