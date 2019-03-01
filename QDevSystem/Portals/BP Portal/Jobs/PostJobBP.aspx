<%@ Page Title="Post Job" Language="C#" MasterPageFile="~/Portals/BP Portal/BP_Portal.Master" AutoEventWireup="true" CodeBehind="PostJobBP.aspx.cs" Inherits="QDevSystem.Portals.BP_Portal.Jobs.PostJobBP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box-body">
        <div class="form-horizontal">
            <br />
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/HomeBP.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server">Job List</a></li>
                <li class="breadcrumb-item">Post Job</li>
            </ol>
            <div>
                <hr />
            </div>
        </div>
    </div>
    <div class="container">
        <div class="jumbotron">
            <h2><b>Post a Job</b></h2>
            <br />

            <div class="form-horizontal">
                <div class="panel-body">
                    <div class="rows">


                        <div class="col-lg-12">
                            <div class="alert alert alert-warning-blue">
                                <strong>IMPORTANT NOTES :</strong>
                                <ul class="important-notes">
                                    <li><span style="color: red;">*</span> Indicates required field</li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Job Title<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtJobTitle" runat="server"
                                        class="form-control" type="text" MaxLength="30" required />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-lg-4">Job Description</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtJobDesc" runat="server"
                                        class="form-control" type="text" MaxLength="500" TextMode="MultiLine" />


                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Monthly Salary<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtMonthlySalary" runat="server"
                                        class="form-control" type="number" MaxLength="10"
                                        required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Posting Start<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtPostStart" runat="server"
                                        class="form-control" type="date" MaxLength="100"
                                        required />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-lg-4">Posting End<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtPostEnd" runat="server"
                                        class="form-control" type="date" MaxLength="100"
                                        required />
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <hr />
                                <div class="form-group text-center">
                                    <asp:Button ID="btnApply" runat="server"
                                        CssClass="btn btn-success"
                                        OnClick="btnApply_Click"
                                        Text="Submit" ValidationGroup="Date"></asp:Button>

                                    <a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server" class="btn btn-secondary">Go Back</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
