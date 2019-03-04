<%@ Page Title="Company Details" Language="C#" MasterPageFile="~/Portals/Admin Portal/IT Admin Portal/IT_Admin_Portal.Master" AutoEventWireup="true" CodeBehind="CompanyDetailsAdmin.aspx.cs" Inherits="QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.BP.CompanyDetailsAdmin" %>
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
                <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/BP/ViewCompaniesAdmin.aspx" runat="server">Company List</a></li>
                <li class="breadcrumb-item"><asp:Literal ID="ltCompID" runat="server" /></li>
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

                    <a href="~/Portals/Admin Portal/IT Admin Portal/BP/ViewCompaniesAdmin.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                </div>

            </div>
        </div>

    </div>
</asp:Content>
