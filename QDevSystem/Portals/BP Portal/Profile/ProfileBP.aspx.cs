using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.BP_Portal.Profile
{
    public partial class ProfileBP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["access_type_id"].ToString() == "2")
            //{
            //    lblCompanyName.Text = Session["company_name"].ToString();
            //    lblCompDesc.Text = Session["company_desc"].ToString();
            //    lblCompAdd.Text = Session["company_address"].ToString();
            //    lblCompEmail.Text = Session["business_email"].ToString();
            //    lblCompContactNo.Text = Session["b_contactno"].ToString();

            //    imgCompanyLogoProfile.ImageUrl = "../../../Files/img/" + Session["company_logo"].ToString();



            //}

            if (!IsPostBack)
            {
                ViewProfileBP();
            }

            
        }

        void ViewProfileBP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT company_name, company_desc, company_address, business_email, b_contactno, company_logo FROM business_access WHERE b_access_id=@BID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@BID", Session["b_access_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblCompanyName.Text = dr["company_name"].ToString();
                                lblCompDesc.Text = dr["company_desc"].ToString();

                                lblCompAdd.Text = dr["company_address"].ToString();
                                lblCompEmail.Text = dr["business_email"].ToString();
                                lblCompContactNo.Text = dr["b_contactno"].ToString();
                                imgCompanyLogoProfile.ImageUrl = "../../../Files/img/" + dr["company_logo"].ToString();

                            }
                        }
                    }
                }
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfileBP.aspx");
        }
    }
}