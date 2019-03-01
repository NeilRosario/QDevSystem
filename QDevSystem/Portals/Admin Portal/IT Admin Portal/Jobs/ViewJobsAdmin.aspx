<%@ Page Title="" Language="C#" MasterPageFile="~/Portals/Admin Portal/IT Admin Portal/IT_Admin_Portal.Master" AutoEventWireup="true" CodeBehind="ViewJobsAdmin.aspx.cs" Inherits="QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Jobs.ViewJobsAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-body">
                    <div class="form-horizontal">
                        <br />
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server">Home</a></li>
                            <li class="breadcrumb-item">Job List</li>
                        </ol>
                        <div>
                            <hr />
                        </div>
                        <input class="form-control" id="myInput" type="text" placeholder="Search..">
                        <br />
                        <table id="myTable" class="table table-hover">
                            <thead class="table-success">
                                <th>Status</th>
                                <th>Company</th>
                                <th>Job Title</th>
                                <th>Job Description</th>
                                <th>Salary</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvJobs" runat="server"
                                    OnPagePropertiesChanging="lvJobs_PagePropertiesChanging">
                                    <%--OnItemCommand="lvJobs_ItemCommand"--%>
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Literal ID="ltJobID" runat="server"
                                                Text='<%#Eval("job_id") %>' Visible="false" />
                                            <td><%#Eval("Description") %></td>
                                            <td><%#Eval("company_name") %></td>
                                            <td><%#Eval("job_title") %></td>
                                            <td><%#Eval("job_description") %></td>
                                            <td>₱ <%#Eval("job_monthly_salary") %></td>


                                            <td>
                                                <a href='JobDetailsAdmin.aspx?ID=<%#Eval("job_id")%>'
                                                    class="btn btn-xs btn-info" title="View Job Details">Job Details
                                                </a>

                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <tr>
                                            <td colspan="10">
                                                <h2 class="text-center">No records found!
                                                </h2>
                                            </td>
                                        </tr>
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </tbody>
                        </table>
                        <div class="col-lg-offset-5">
                             <asp:DataPager ID="dpJobs" runat="server"
                                    PagedControlID="lvJobs" PageSize="10">
                                   <Fields>
                                       <asp:NumericPagerField
                                     ButtonType="Button"
                                     CurrentPageLabelCssClass="btn btn"
                                     NumericButtonCssClass="btn btn"
                                     NextPreviousButtonCssClass="btn btn-default"
                                     ButtonCount="5" />
                                   </Fields>
                          </asp:DataPager>
                           </div>
                        <script>
                            $(document).ready(function () {
                                $("#myInput").on("keyup", function () {
                                    var value = $(this).val().toLowerCase();
                                    $("#myTable tr").filter(function () {
                                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                                    });
                                });
                            });
                        </script>

                        <hr />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
