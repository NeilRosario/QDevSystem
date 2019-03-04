using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.BP
{
    public partial class CompanyDetailsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("ViewCompanyListApplicant.aspx");
            }
            else
            {
                int compID = 0;
                bool validcompid = int.TryParse(Request.QueryString["ID"].ToString(), out compID);

                if (validcompid)
                {
                    if (!IsPostBack)
                    {
                        ViewProfileBP(compID);
                        getCompID(compID);
                    }
                }
                else
                {
                    Response.Redirect("ViewCompanyListApplicant.aspx");
                }
            }

        }

        void getCompID(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                string cmd = @"SELECT b_access_id, company_name from business_access WHERE b_access_id=@BID";
                con.Open();
                using (SqlCommand com = new SqlCommand(cmd, con))
                {
                    com.Parameters.AddWithValue("@BID", ID);

                    using (SqlDataReader dr = com.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                ltCompID.Text = dr["company_name"].ToString();
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewCompanyListApplicant.aspx");
                        }
                    }
                }
            }

        }


        void ViewProfileBP(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT company_name, company_desc, company_address, business_email, b_contactno, company_logo FROM business_access WHERE b_access_id=@BID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@BID", ID);

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
                                imgCompanyLogoProfile.ImageUrl = "../../../../../Files/img/" + dr["company_logo"].ToString();

                            }
                        }
                    }
                }
            }
        }
    }
}