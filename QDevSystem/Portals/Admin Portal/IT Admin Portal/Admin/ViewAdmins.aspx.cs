using QDevSystem.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Admin
{
    public partial class ViewAdmins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAdmins();
            }
        }

        void GetAdmins()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetConnection()))
            {
                con.Open();
                string cmd = @"SELECT admin.admin_id, access.access_name, admin.admin_email, admin.last_name + ', ' + admin.first_name + ' ' + admin.middle_name 
                            AS 'Full Name' FROM admin_details admin INNER JOIN access_type access
                            ON admin.access_type_id=access.access_type_id ORDER BY access.access_name ASC";

                using (SqlCommand com = new SqlCommand(cmd, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(com))
                    {
                        DataSet ds = new DataSet();
                        sda.Fill(ds, "admin_details");
                        lvAdmins.DataSource = ds;
                        lvAdmins.DataBind();

                    }
                }

            }
        }
        protected void lvAdmins_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpAdmins.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            GetAdmins();
        }
    }

}