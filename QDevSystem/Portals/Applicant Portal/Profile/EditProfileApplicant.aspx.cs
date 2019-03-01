using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Applicant_Portal.Profile
{
    public partial class EditProfileApplicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewProfileApplicant();
                ViewProfileApplicantAddress();
                ViewProfileApplicantContactDetails();
                GetRegion();
            }

        }

        // View Existing Data

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
                                txtFN.Text = dr["first_name"].ToString();
                                txtMN.Text = dr["middle_name"].ToString();
                                txtLN.Text = dr["last_name"].ToString();

                                txtEmail.Text = dr["a_email"].ToString();
                                txtDOB.Text = dr["date_of_birth"].ToString();

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
                                txtHomeNo.Text = dr["home_phone"].ToString();
                                txtMobileNo.Text = dr["mobile_number"].ToString();
                                txtAltNo.Text = dr["alternate_mobile"].ToString();


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
                                ddlRegion.Text = dr["region_name"].ToString();
                                txtBldgNo.Text = dr["no_bldg_street"].ToString();
                                txtAptNo.Text = dr["apartment_no"].ToString();
                                txtStreet.Text = dr["street_name"].ToString();
                                txtZip.Text = dr["zip_code"].ToString();
                                txtCity.Text = dr["city_name"].ToString();


                            }
                        }
                    }
                }
            }
        }

        void GetRegion()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT region_id, region_name FROM ph_region";
                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        ddlRegion.DataSource = dr;
                        ddlRegion.DataTextField = "region_name";
                        ddlRegion.DataValueField = "region_id";
                        ddlRegion.DataBind();

                        ddlRegion.Items.Insert(0, new ListItem("Select a Region.", ""));

                    }
                }






            }
        }



        // Update Existing Data

        void UpdateProfileApplicant()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"UPDATE applicant_basic_info SET first_name=@LN, middle_name=@MN, last_name=@LN, a_email=@Mail, date_of_birth=@DOB, 
                              applicant_profile_picture=@PP WHERE applicant_id =@AID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                    cmd.Parameters.AddWithValue("@FN", txtFN.Text);
                    cmd.Parameters.AddWithValue("@MN", txtMN.Text);
                    cmd.Parameters.AddWithValue("@LN", txtLN.Text);
                    cmd.Parameters.AddWithValue("@Mail", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);



                    string fileExt = Path.GetExtension(FileContent.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@PP", id + fileExt);
                    FileContent.SaveAs(Server.MapPath("~/Files/img/" + id + fileExt));

                    cmd.ExecuteNonQuery();



                }
            }
        }




        void UpdateProfileApplicantContactDetails()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                // Verifies if record for applicant is already existing.
                bool exists = false;
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM applicant_contact_details WHERE applicant_id = @applicant_id", con))
                {
                    cmd.Parameters.AddWithValue("@applicant_id", Session["applicant_id"].ToString());
                    exists = (int)cmd.ExecuteScalar() > 0;
                }

                //if exists, update existing record (old user)
                if (exists)
                {
                    string SQL = @"UPDATE applicant_contact_details SET home_phone=@HN, mobile_number=@MN, alternate_mobile=@AN WHERE applicant_id =@AID";

                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                        cmd.Parameters.AddWithValue("@HN", txtHomeNo.Text);
                        cmd.Parameters.AddWithValue("@MN", txtMobileNo.Text);
                        cmd.Parameters.AddWithValue("@AN", txtAltNo.Text);

                        cmd.ExecuteNonQuery();

                    }
                }

                //if not, new record will be made to complete registration (new user)
                else
                {
                    string SQL = @"INSERT applicant_contact_details (applicant_id, home_phone, mobile_number, alternate_mobile) 
                                   VALUES (@applicant_id, @home_phone, @mobile_number, @alternate_mobile)";

                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        cmd.Parameters.AddWithValue("@applicant_id", Session["applicant_id"].ToString());

                        cmd.Parameters.AddWithValue("@home_phone", txtHomeNo.Text);
                        cmd.Parameters.AddWithValue("@mobile_number", txtMobileNo.Text);
                        cmd.Parameters.AddWithValue("@alternate_mobile", txtAltNo.Text);

                        cmd.ExecuteNonQuery();



                    }
                }
                    
                    
            }
        }
    

        void UpdateViewProfileApplicantAddress()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                // Verifies if record for applicant is already existing.
                bool exists = false;
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM applicant_address WHERE applicant_id = @applicant_id", con))
                {
                    cmd.Parameters.AddWithValue("@applicant_id", Session["applicant_id"].ToString());
                    exists = (int)cmd.ExecuteScalar() > 0;
                }

                //if exists, update existing record (old user)
                if (exists)
                {
                    string SQL = @"UPDATE applicant_address SET region_id=@RI, no_bldg_street=@bldg, apartment_no=@appNo, street_name=@street, zip_code=@zip, city_name=@city WHERE applicant_id =@AID";

                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());

                        cmd.Parameters.AddWithValue("@RI", ddlRegion.Text);
                        cmd.Parameters.AddWithValue("@bldg", txtBldgNo.Text);
                        cmd.Parameters.AddWithValue("@appNo", txtAptNo.Text);
                        cmd.Parameters.AddWithValue("@street", txtStreet.Text);
                        cmd.Parameters.AddWithValue("@zip", txtZip.Text);
                        cmd.Parameters.AddWithValue("@city", txtCity.Text);


                        cmd.ExecuteNonQuery();


                    }
                }

                //if not, new record will be made to complete registration (new user)
                else
                {
                    string SQL = @"INSERT applicant_address (applicant_id, region_id, no_bldg_street, apartment_no, street_name, zip_code, city_name) 
                                   VALUES (@applicant_id, @region_id, @no_bldg_street, @apartment_no, @street_name, @zip_code, @city_name)";

                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        cmd.Parameters.AddWithValue("@applicant_id", Session["applicant_id"].ToString());

                        cmd.Parameters.AddWithValue("@region_id", ddlRegion.Text);
                        cmd.Parameters.AddWithValue("@no_bldg_street", txtBldgNo.Text);
                        cmd.Parameters.AddWithValue("@apartment_no", txtAptNo.Text);
                        cmd.Parameters.AddWithValue("@street_name", txtStreet.Text);
                        cmd.Parameters.AddWithValue("@zip_code", txtZip.Text);
                        cmd.Parameters.AddWithValue("@city_name", txtCity.Text);

                        cmd.ExecuteNonQuery();



                    }
                }
                    
            }
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {


            UpdateProfileApplicant();
            UpdateProfileApplicantContactDetails();
            UpdateViewProfileApplicantAddress();
            Response.Redirect("ProfileApplicant.aspx");

        }
    }
}