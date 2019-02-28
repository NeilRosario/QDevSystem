using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.BP_Portal.Profile
{
    public partial class EditProfileBP : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewProfileBP();
            }

            //txtCompanyName.Text = Session["company_name"].ToString();
            //txtCompDesc.Text = Session["company_desc"].ToString();
            //txtCompAdd.Text = Session["company_address"].ToString();
            //txtCompEmail.Text = Session["business_email"].ToString();
            //txtCompContactNo.Text = Session["b_contactno"].ToString();

            //imgCompanyLogoProfile.ImageUrl = "../../../Files/img/" + Session["company_logo"].ToString();

            

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
                                txtCompanyName.Text = dr["company_name"].ToString();
                                txtCompDesc.Text = dr["company_desc"].ToString();

                                txtCompAdd.Text = dr["company_address"].ToString();
                                txtCompEmail.Text = dr["business_email"].ToString();
                                txtCompContactNo.Text = dr["b_contactno"].ToString();
                                imgCompanyLogoProfile.ImageUrl = "../../../Files/img/" + dr["company_logo"].ToString();

                            }
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"UPDATE business_access SET company_name=@CN, company_desc=@CD, company_address=@CA, business_email=@Mail, b_contactno=@No, 
                              company_logo=@CL WHERE b_access_id =@BID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@BID", Session["b_access_id"].ToString());

                    cmd.Parameters.AddWithValue("@CN", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@CD", txtCompDesc.Text);
                    cmd.Parameters.AddWithValue("@CA", txtCompAdd.Text);
                    cmd.Parameters.AddWithValue("@Mail", txtCompEmail.Text);
                    cmd.Parameters.AddWithValue("@No", txtCompContactNo.Text);


                    string fileExt = Path.GetExtension(FileContent.FileName);
                    string id = Guid.NewGuid().ToString();
                    cmd.Parameters.AddWithValue("@CL", id + fileExt);
                    FileContent.SaveAs(Server.MapPath("~/Files/img/" + id + fileExt));

                    cmd.ExecuteNonQuery();

                    Response.Redirect("ProfileBP.aspx");

                }
            }
        }

       
    }
}