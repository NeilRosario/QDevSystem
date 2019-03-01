using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Jobs
{
    public partial class ViewJobsAdmin : System.Web.UI.Page
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

        protected void lvJobs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpJobs.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            ViewJobs();
        }
    }

}