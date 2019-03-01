<%@ Page Title="Jobs" Language="C#" MasterPageFile="~/Portals/BP Portal/BP_Portal.Master" AutoEventWireup="true" CodeBehind="ViewJobsBP.aspx.cs" Inherits="QDevSystem.Portals.BP_Portal.Jobs.ViewJobsBP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <div class="box-body">
                    <div class="form-horizontal">
                        <br/>
                        
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="~/Portals/BP Portal/HomeBP.aspx" runat="server">Home</a></li>
                            <li class="breadcrumb-item">Jobs List</li>
                            <li class="breadcrumb-item"><a href="~/Portals/BP Portal/Jobs/PostJobBP.aspx" runat="server">Post Job</a></li>
                        </ol>
                        <div>

                            <hr />
                        </div>

                        <table id="table" class="table table-hover">
                            <thead class="table-success">
                                <th>Approval Status</th>
                                <th>Job Status</th>
                                <th>Job Title</th>
                                <th>Job Description</th>
                                <th>Monthly Salary</th>
                                <th>Date Submitted</th>
                                <th>Posting Start</th>
                                <th>Posting End</th>
                                <th></th>
                            </thead>
                            <tbody>
                                <asp:ListView ID="lvJobs" runat="server"
                                    OnItemCommand="lvJobs_ItemCommand"
                                    OnPagePropertiesChanging="lvJobs_PagePropertiesChanging">
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Literal ID="ltJobID" runat="server"
                                                Text='<%#Eval("job_id") %>' Visible="false" />

                                            <td><%#Eval("description") %></td>
                                            <td><%#Eval("job status") %></td>
                                            <td><%#Eval("job_title") %></td>
                                            <td><%#Eval("job_description") %></td>
                                            <td>₱ <%#Eval("job_monthly_salary") %></td>
                                            <td><%#Eval("date_submitted") %></td>
                                            <td><%#Eval("posting_start") %></td>
                                            <td><%#Eval("posting_end") %></td>

                                            <td>
                                                <a href='JobBPDetails.aspx?ID=<%#Eval("job_id")%>'
                                                    class="btn btn-xs btn-info" title="View Job Details">View Job Details
                                                </a>

                                                <a href='EditJobBP.aspx?ID=<%#Eval("job_id")%>'
                                                    class="btn btn-xs btn-warning" title="Edit Job">Edit Job Details
                                                </a>

                                                <asp:LinkButton ID="btnDelete" runat="server"
                                                    class="btn btn-xs btn-danger" CommandName="deljob">
                                                     Delete Job
                                                </asp:LinkButton>
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
                        <hr />
                        <div class="col-lg-offset-5">
                            <asp:DataPager ID="dpJobs" runat="server"
                                PagedControlID="lvJobs" PageSize="10">
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
