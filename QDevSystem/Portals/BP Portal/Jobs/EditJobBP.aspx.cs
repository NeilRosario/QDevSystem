using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.BP_Portal.Jobs
{
    public partial class EditJobBP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("ViewJobs.aspx");
            }
            else
            {
                int id = 0;
                bool validid = int.TryParse(Request.QueryString["ID"].ToString(), out id);
                if (validid)
                {
                    if (!IsPostBack)
                    {
                        GetID(id);
                        ViewJobBPDetails(id);

                    }

                }
                else
                {
                    Response.Redirect("ViewJobs.aspx");
                }
            }

        }

        void GetID(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                string SQL = @"SELECT j.job_title + ' - ' + b.company_name AS 'Job Title' FROM job_posting j
                            INNER JOIN business_access b ON j.b_access_id=b.b_access_id WHERE j.job_id=@JID";
                con.Open();
                using (SqlCommand com = new SqlCommand(SQL, con))
                {
                    com.Parameters.AddWithValue("@JID", ID);

                    using (SqlDataReader dr = com.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                ltJID.Text = dr["Job Title"].ToString();
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewJobs.aspx");
                        }
                    }
                }
            }

        }

        void ViewJobBPDetails(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"SELECT job_post_status_id, job_title, job_description, job_monthly_salary, job_location
                               FROM job_posting         
							   WHERE job_id=@JID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@JID", ID);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {

                                txtJobTitle.Text = dr["job_title"].ToString();
                                txtJobLocation.Text = dr["job_location"].ToString();
                                txtSal.Text = dr["job_monthly_salary"].ToString();
                                txtDesc.Text = dr["job_description"].ToString();
                                rdStatus.SelectedValue = dr["job_post_status_id"].ToString();

                            }
                        }
                    }
                }
            }
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string SQL = @"UPDATE job_posting SET job_location=@JL, job_title=@JT, job_description=@JD, job_monthly_salary=@JMS, job_post_status_id=@JP where job_id =@JID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@JID", Request.QueryString["ID"].ToString());

                    cmd.Parameters.AddWithValue("@JL", txtJobLocation.Text);
                    cmd.Parameters.AddWithValue("@JT", txtJobTitle.Text);
                    cmd.Parameters.AddWithValue("@JD", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@JMS", txtSal.Text);
                    cmd.Parameters.AddWithValue("@JP", rdStatus.SelectedValue);


                    cmd.ExecuteNonQuery();

                    Response.Redirect("ViewJobsBP.aspx");
                    
                }
            }
        }
    }
}