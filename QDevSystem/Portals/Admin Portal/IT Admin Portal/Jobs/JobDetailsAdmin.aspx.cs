using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Jobs
{
    public partial class JobDetailsAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("ViewJobsApplicant.aspx");
            }
            else
            {
                int id = 0;
                bool validid = int.TryParse(Request.QueryString["ID"].ToString(), out id);
                if (validid)
                {
                    if (!IsPostBack)
                    {
                        GetJobTitle(id);
                        ViewJobBPDetails(id);
                        GetID(id);
                    }

                }
                else
                {
                    Response.Redirect("ViewJobsApplicant.aspx");
                }
            }

        }

        void GetJobTitle(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                string SQL = @"SELECT job_title  AS 'Job Title' FROM job_posting WHERE job_id=@JID";
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
                                ltJobID.Text = dr["Job Title"].ToString();
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewJobsApplicant.aspx");
                        }
                    }
                }
            }

        }

        void GetID(int ID)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                string SQL = @"SELECT job_id FROM job_posting WHERE job_id=@JID";
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
                                ltID.Text = dr["job_id"].ToString();
                            }
                        }
                        else
                        {
                            Response.Redirect("ViewJobsApplicant.aspx");
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
                string SQL = @"SELECT b.company_name, js.Description as 'job status', a.description as 'approval status', j.job_description, j.job_monthly_salary, j.job_location FROM job_posting j
                            INNER JOIN business_access b ON j.b_access_id=b.b_access_id
                            INNER JOIN job_post_status js ON j.job_post_status_id = js.job_post_status_id
                            INNER JOIN approval_request a ON j.approval_id = a.approval_id
                            WHERE j.job_id=@JID";

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@JID", ID);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.HasRows)
                        {
                            while (dr.Read())
                            {
                                lblApprovalStatus.Text = dr["approval status"].ToString();
                                lblJobStatus.Text = dr["job status"].ToString();
                                lblCompany.Text = dr["company_name"].ToString();
                                lblJobLocation.Text = dr["job_location"].ToString();
                                lblMonthlySalary.Text = "₱ " + dr["job_monthly_salary"].ToString();
                                lblJobDesc.Text = dr["job_description"].ToString();

                            }
                        }
                    }
                }
            }
        }
    }
}