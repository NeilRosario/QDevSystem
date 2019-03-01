using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Applicant_Portal.Jobs
{
    public partial class ViewJobsApplicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewJobs();
            }
        }


        void ViewJobs()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {

                con.Open();
                string cmd = @"SELECT j.job_id, b.company_name, j.job_title, s.Description, j.job_description, 
                            j.job_monthly_salary FROM job_posting j 
                            INNER JOIN job_post_status s 
                            ON j.job_post_status_id = s.job_post_status_id
                            INNER JOIN business_access b
                            ON j.b_access_id = b.b_access_id";

                using (SqlCommand com = new SqlCommand(cmd, con))
                {
                    
                    using (SqlDataAdapter sda = new SqlDataAdapter(com))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds, "job_posting");
                        lvJobs.DataSource = ds;
                        lvJobs.DataBind();

                    }
                }
            }
        }

        protected void lvJobs_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltJobID = (Literal)e.Item.FindControl("ltJobID");

            if (e.CommandName == "sendapplication")
            {

                using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
                {
                    con.Open();
                    string SQL = @"INSERT INTO job_application (job_id, applicant_id, status_id, date_applied)
                                   VALUES (@JID, @AID, @SID, @DateApplied)";

                    using (SqlCommand cmd = new SqlCommand(SQL, con))
                    {
                        cmd.Parameters.AddWithValue("@JID", ltJobID.Text);
                        cmd.Parameters.AddWithValue("@AID", Session["applicant_id"].ToString());
                        cmd.Parameters.AddWithValue("@SID", 1);
                        cmd.Parameters.AddWithValue("@DateApplied", DateTime.Now);
                        cmd.ExecuteNonQuery();

                        Response.Redirect("ViewCompanyJob.aspx");
                    }
                }
            }


        }

        protected void lvJobs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpJobs.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            ViewJobs();
        }


    }
}