using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Applicant
{
    public partial class ApplicantDetailsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("ViewApplicantsAdmin.aspx");
            }
            else
            {
                int appID = 0;
                bool validappid = int.TryParse(Request.QueryString["ID"].ToString(), out appID);

                if (validappid)
                {
                    if (!IsPostBack)
                    {
                        ViewProfileApplicant(appID);
                        ViewProfileApplicantAddress(appID);
                        ViewProfileApplicantContactDetails(appID);
                        getappID(appID);
                    }
                }
                else
                {
                    Response.Redirect("ViewApplicantsAdmin.aspx");
                }
            }
            
            

        }

        void getappID(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                string cmd = @"SELECT applicant_id, last_name + ', ' + first_name + ' ' + middle_name AS 'name' from applicant_basic_info WHERE applicant_id=@AID";
                con.Open();
                using (SqlCommand com = new SqlCommand(cmd, con))
                {
                    com.Parameters.AddWithValue("@AID", ID);

                    using (SqlDataReader dr = com.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                ltAppID.Text = dr["name"].ToString();
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewApplicantsAdmin.aspx");
                        }
                    }
                }
            }

        }

        void ViewProfileApplicant(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT first_name, middle_name, last_name, a_email, date_of_birth, applicant_profile_picture FROM applicant_basic_info WHERE applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", ID);

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

                                imgApplicantPic.ImageUrl = "../../../../../Files/img/" + dr["applicant_profile_picture"].ToString();

                            }
                        }
                    }
                }
            }
        }

        void ViewProfileApplicantContactDetails(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT home_phone, mobile_number, alternate_mobile FROM applicant_contact_details WHERE applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", ID);

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

        void ViewProfileApplicantAddress(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT r.region_name, a.no_bldg_street, a.apartment_no, a.street_name, a.zip_code, a.city_name FROM applicant_address a
                               INNER JOIN ph_region r ON a.region_id = r.region_id 
                               WHERE a.applicant_id=@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", ID);

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

    }
}