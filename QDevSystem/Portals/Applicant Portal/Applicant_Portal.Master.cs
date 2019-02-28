using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Applicant_Portal
{
    public partial class Applicant_Portal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ViewProfileBP();
        }

        void ViewProfileBP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT last_name + ', ' + first_name + ' ' + middle_name AS 'profile name', applicant_profile_picture FROM applicant_basic_info WHERE applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblShowUser.Text = dr["profile name"].ToString();
                                imgApplicantPic.ImageUrl = "../../Files/img/" + dr["applicant_profile_picture"].ToString();

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