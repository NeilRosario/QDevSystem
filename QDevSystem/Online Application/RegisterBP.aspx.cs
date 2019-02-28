﻿using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Online_Application
{
    public partial class RegisterBP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnApply_Click(object sender, EventArgs e)
        {
            using (SqlConnection Con = new SqlConnection(Helper.GetConnection()))
            {

                Con.Open();

                // Verifies if Email is Existing.
                bool exists = false;
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM business_access WHERE business_email = @business_email", Con))
                {
                    cmd.Parameters.AddWithValue("@business_email", txtEmail.Text);
                    exists = (int)cmd.ExecuteScalar() > 0;
                }

                // If email already exists
                // Error Code will be shown
                // test
                if (exists)
                {
                    error.Visible = true;
                }

                //Else the registration will continue.
                else
                {
                    string SQL = @"INSERT INTO business_access (access_type_id, business_email, business_password, company_name, company_address, company_desc, b_contactno)

                                              VALUES (@access_type_id, @business_email, @business_password, @company_name, @company_address, @company_desc, @b_contactno)";

                    using (SqlCommand cmd = new SqlCommand(SQL, Con))
                    {
                        cmd.Parameters.AddWithValue("@access_type_id", 2);

                        cmd.Parameters.AddWithValue("@business_email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@business_password", txtPW.Text);
                        cmd.Parameters.AddWithValue("@company_name", txtCompany.Text);

                        cmd.Parameters.AddWithValue("@company_desc", txtCompanyDesc.Text);

                        cmd.Parameters.AddWithValue("@company_address", "Empty");
                        cmd.Parameters.AddWithValue("@b_contactno", "Empty");

                        string fileExt = Path.GetExtension(FileContent.FileName);
                        string id = Guid.NewGuid().ToString();
                        cmd.Parameters.AddWithValue("@company_logo", id + fileExt);
                        FileContent.SaveAs(Server.MapPath("~/Files/img/" + id + fileExt));

                        cmd.ExecuteNonQuery();


                        Response.Redirect("~/Default.aspx");

                    }
                }


            }

        }



       
    }
}

