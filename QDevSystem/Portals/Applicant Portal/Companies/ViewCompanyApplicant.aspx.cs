using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Applicant_Portal.Companies
{
    public partial class ViewCompanyApplicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetComp();
            }
        }


        void GetComp()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string cmd = @"SELECT b_access_id, company_name, b_contactno, business_email " +
                               "FROM business_access";


                using (SqlCommand com = new SqlCommand(cmd, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(com))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds, "business_access");

                        lvComp.DataSource = ds;
                        lvComp.DataBind();

                    }
                }
            }
        }


        protected void lvComp_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpComp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            GetComp();
        }
    }
}
