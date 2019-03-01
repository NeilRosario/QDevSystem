<%@ Page Title="Job Details" Language="C#" MasterPageFile="~/Portals/BP Portal/BP_Portal.Master" AutoEventWireup="true" CodeBehind="JobBPDetails.aspx.cs" Inherits="QDevSystem.Portals.BP_Portal.Jobs.JobBPDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box-body">
        <div class="form-horizontal">
            <br />
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/HomeBP.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server">Job List</a></li>
                <li class="breadcrumb-item">Job Details</li>
            </ol>
            <div>
                <hr />
            </div>
        </div>
    </div>
    <div class="container">
        <div class="jumbotron">
            <h2>
                <asp:Literal ID="ltJID" runat="server" Visible="true" />
            </h2>
            <br />

            <div class="form-group">
                <label for="approvalStatus">Approval Status</label>
                <br />
                <asp:Label runat="server" ID="lblApprovalStatus" />
            </div>

            <div class="form-group">
                <label for="approvalStatus">Job Status</label>
                <br />
                <asp:Label runat="server" ID="lblJobStatus" />
            </div>

            <div class="form-group">
                <label for="Company">Company</label>
                <br />
                <asp:Label runat="server" ID="lblCompany" />
            </div>

            <div class="form-group">
                <label for="jobMonthlySalaray">Monthly Salary</label>
                <br />
                <asp:Label runat="server" ID="lblMonthlySalary" />
            </div>

            <div class="form-group">
                <label for="jobDesc">Job Description</label>
                <br />
                <asp:Label runat="server" ID="lblJobDesc" />
            </div>

            <div class="form-group">
                <label for="jobLocation">Job Location</label>
                <br />
                <asp:Label runat="server" ID="lblJobLocation" />
            </div>

            <a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server" class="btn btn-secondary">Go Back</a>


        </div>
    </div>
</asp:Content>
