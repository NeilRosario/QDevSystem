<%@ Page Title="Company Details" Language="C#" MasterPageFile="~/Portals/Applicant Portal/Applicant_Portal.Master" AutoEventWireup="true" CodeBehind="CompanyDetailsApplicant.aspx.cs" Inherits="QDevSystem.Portals.Applicant_Portal.Companies.CompanyDetailsApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .container {
            position: relative;
            width: 50%;
        }

        .image {
            display: block;
            width: 100%;
            height: auto;
        }
    </style>

    <div class="box-body">
        <div class="form-horizontal">
            <br />
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="~/Portals/Applicant Portal/HomeApplicant.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/Applicant Portal/Companies/ViewCompanyApplicant.aspx" runat="server">Company List</a></li>
                <li class="breadcrumb-item"><asp:Literal ID="ltCompID" runat="server" /> 's Company Details</li>
            </ol>
            <div>

                <hr />
            </div>
        </div>
    </div>
    <div class="jumbotron">

        <div class="container">
            <div class="col-md-3">
                <asp:Image runat="server" ID="imgCompanyLogoProfile" class="image" />
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="compName">Company Name</label>
                    <br />
                    <asp:Label runat="server" ID="lblCompanyName" />
                </div>
                <div class="form-group">
                    <label for="compDesc">Description</label>
                    <br />
                    <asp:Label runat="server" ID="lblCompDesc" />
                </div>
                <div class="form-group">
                    <label for="compAddress">Address</label>
                    <br />
                    <asp:Label runat="server" ID="lblCompAdd" />
                </div>
                <div class="form-group">
                    <label for="compEmail">Email</label>
                    <br />
                    <asp:Label runat="server" ID="lblCompEmail" />
                </div>
                <div class="form-group">
                    <label for="compContactNo">Contact #</label>
                    <br />
                    <asp:Label runat="server" ID="lblCompContactNo" />
                </div>

                <div class="form-group text-center">

                    <a href="~/Portals/Applicant Portal/Companies/ViewCompanyApplicant.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
