using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Applicant_Portal.Profile
{
    public partial class ProfileApplicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewProfileApplicant();
                ViewProfileApplicantAddress();
                ViewProfileApplicantContactDetails();
            }

        }

        void ViewProfileApplicant()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT first_name, middle_name, last_name, a_email, date_of_birth, applicant_profile_picture FROM applicant_basic_info WHERE applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblFN.Text = dr["first_name"].ToString();
                                lblMN.Text = dr["middle_name"].ToString();
                                lblLN.Text = dr["last_name"].ToString();

                                lblEmail.Text = dr["a_email"].ToString();
                                lblDOB.Text = dr["date_of_birth"].ToString();

                                imgApplicantPic.ImageUrl = "../../../Files/img/" + dr["applicant_profile_picture"].ToString();

                            }
                        }
                    }
                }
            }
        }

        void ViewProfileApplicantContactDetails()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT home_phone, mobile_number, alternate_mobile FROM applicant_contact_details WHERE applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblHomeNo.Text = dr["home_phone"].ToString();
                                lblMobileNo.Text = dr["mobile_number"].ToString();
                                lblAtNo.Text = dr["alternate_mobile"].ToString();
                                

                            }
                        }
                    }
                }
            }
        }

        void ViewProfileApplicantAddress()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT r.region_name, a.no_bldg_street, a.apartment_no, a.street_name, a.zip_code, a.city_name FROM applicant_address a
                               INNER JOIN ph_region r ON a.region_id = r.region_id 
                               WHERE a.applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblRegion.Text = dr["region_name"].ToString();
                                lblBldgNo.Text = dr["no_bldg_street"].ToString();
                                lblAptNo.Text = dr["apartment_no"].ToString();
                                lblStreet.Text = dr["street_name"].ToString();
                                lblZip.Text = dr["zip_code"].ToString();
                                lblCity.Text = dr["city_name"].ToString();

                                
                            }
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfileApplicant.aspx");
        }
    }
}