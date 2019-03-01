<%@ Page Title="Companies" Language="C#" MasterPageFile="~/Portals/Applicant Portal/Applicant_Portal.Master" AutoEventWireup="true" CodeBehind="ViewCompanyApplicant.aspx.cs" Inherits="QDevSystem.Portals.Applicant_Portal.Companies.ViewCompanyApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-body">
                    <div class="form-horizontal">
                        <br />
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="~/Portals/Applicant Portal/HomeApplicant.aspx" runat="server">Home</a></li>
                            <li class="breadcrumb-item">Company List</li>
                        </ol>
                        <div>
                            <hr />
                        </div>
                        <input class="form-control" id="myInput" type="text" placeholder="Search..">
                        <br />
                        <table id="mytable" class="table table-hover">
                            <thead class="table-success">
                                <th>Company Name</th>
                                <th>Contact Number</th>
                                <th>Company Email</th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvComp" runat="server"
                                    OnPagePropertiesChanging="lvComp_PagePropertiesChanging">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Literal ID="ltCompID" runat="server"
                                                Text='<%#Eval("b_access_id") %>' Visible="false" />

                                            <td><%#Eval("company_name") %></td>
                                            <td><%#Eval("b_contactno") %></td>
                                            <td><%#Eval("business_email") %></td>

                                            <td>
                                                <a href='CompanyDetailsApplicant.aspx?ID=<%#Eval("b_access_id")%>'
                                                    class="btn btn-xs btn-success" title="View Company Details">View Company Details
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
                            <asp:DataPager ID="dpComp" runat="server"
                                PagedControlID="lvComp" PageSize="10">
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
