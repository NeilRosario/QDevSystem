<%@ Page Title="" Language="C#" MasterPageFile="~/Portals/Admin Portal/IT Admin Portal/IT_Admin_Portal.Master" AutoEventWireup="true" CodeBehind="ViewAdmins.aspx.cs" Inherits="QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Admin.ViewAdmins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-body">
                    <div class="form-horizontal">
                        <br />
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server">Home</a></li>
                            <li class="breadcrumb-item">Company List</li>
                        </ol>
                        <div>
                            <hr />
                        </div>
                        <input class="form-control" id="myInput" type="text" placeholder="Search..">
                        <br />
                        <table id="myTable" class="table table-hover">
                            <thead class="table-success">
                                <th>Applicant Email</th>
                                <th>Full Name </th>
                                <th>Date of Birth</th>
                                <th>Gender</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvAdmins" runat="server"
                                    OnPagePropertiesChanging="lvAdmins_PagePropertiesChanging">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Literal ID="ltAppID" runat="server"
                                                Text='<%#Eval("admin_id") %>' Visible="false" />
                                            <td><%#Eval("admin_email") %></td>
                                            <td><%#Eval("Full Name") %></td>
                                            <td><%#Eval("access_name") %></td>


                                            <td>
                                                <a href='ApplicantDetailsAdmin.aspx?ID=<%#Eval("admin_id")%>'
                                                    class="btn btn-xs btn-success" title="View Admin Details">View Admin Details
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
                        <div class="col-lg-offset-5">
                            <asp:DataPager ID="dpAdmins" runat="server"
                                PagedControlID="lvAdmins" PageSize="10">
                                <Fields>
                                    <asp:NumericPagerField
                                        ButtonType="Button"
                                        CurrentPageLabelCssClass="btn btn"
                                        NumericButtonCssClass="btn btn"
                                        NextPreviousButtonCssClass="btn btn-default"
                                        ButtonCount="10" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
