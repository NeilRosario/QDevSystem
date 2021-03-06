﻿<%@ Page Title="Job Details" Language="C#" MasterPageFile="~/Portals/Admin Portal/IT Admin Portal/IT_Admin_Portal.Master" AutoEventWireup="true" CodeBehind="JobDetailsAdmin.aspx.cs" Inherits="QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Jobs.JobDetailsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box-body">
        <div class="form-horizontal">
            <br />
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/Jobs/ViewJobsAdmin.aspx" runat="server">Job List</a></li>
                <li class="breadcrumb-item">
                    <asp:Literal ID="ltJobID" runat="server" /></li>

                <asp:Literal ID="ltID" runat="server" Visible="false" />
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

            <div class="col-lg-12">
                <a href="~/Portals/Admin Portal/IT Admin Portal/Jobs/ViewJobsAdmin.aspx" runat="server" class="btn btn-secondary">Go Back</a>
            </div>


        </div>
    </div>
</asp:Content>
