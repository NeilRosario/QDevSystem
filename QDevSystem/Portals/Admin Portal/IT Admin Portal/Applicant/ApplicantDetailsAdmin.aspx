<%@ Page Title="" Language="C#" MasterPageFile="~/Portals/Admin Portal/IT Admin Portal/IT_Admin_Portal.Master" AutoEventWireup="true" CodeBehind="ApplicantDetailsAdmin.aspx.cs" Inherits="QDevSystem.Portals.Admin_Portal.IT_Admin_Portal.Applicant.ApplicantDetailsAdmin" %>
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
                <li class="breadcrumb-item"><a href="~/Portals/Admin Portal/IT Admin Portal/Applicant/ViewApplicantsAdmin.aspx" runat="server">Applicant List</a></li>
                <li class="breadcrumb-item"><asp:Literal ID="ltAppID" runat="server" /></li>
            </ol>
            <div>

                <hr />
            </div>
        </div>
    </div>
   <div class="jumbotron">
        <div class="container">
            <div class="col-md-3">
                <asp:Image runat="server" ID="imgApplicantPic" class="image" />
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <br />
                    <asp:Label runat="server" ID="lblFN" />
                </div>

                <div class="form-group">
                    <label for="middleName">Middle Name</label>
                    <br />
                    <asp:Label runat="server" ID="lblMN" />
                </div>

                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <br />
                    <asp:Label runat="server" ID="lblLN" />
                </div>

                <div class="form-group">
                    <label for="appEmail">Email</label>
                    <br />
                    <asp:Label runat="server" ID="lblEmail" />
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <br />
                    <asp:Label runat="server" ID="lblDOB" />
                </div>

                <div class="form-group">
                    <label for="appHomeNo">Home #</label>
                    <br />
                    <asp:Label runat="server" ID="lblHomeNo" />
                </div>

                <div class="form-group">
                    <label for="appMobileNo">Mobile #</label>
                    <br />
                    <asp:Label runat="server" ID="lblMobileNo" />
                </div>

                <div class="form-group">
                    <label for="appAltNo">Alternate #</label>
                    <br />
                    <asp:Label runat="server" ID="lblAtNo" />
                </div>
                <div class="form-group text-center">
                    <a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server" class="btn btn-secondary">View Documents</a>
                    <a href="~/Portals/Admin Portal/IT Admin Portal/HomeITAdmin.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                    
                </div>

            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="region">Region</label>
                    <br />
                    <asp:Label runat="server" ID="lblRegion" />
                </div>
                <div class="form-group">
                    <label for="bldgNo">Bldg #</label>
                    <br />
                    <asp:Label runat="server" ID="lblBldgNo" />
                </div>

                <div class="form-group">
                    <label for="appNo">Apartment #</label>
                    <br />
                    <asp:Label runat="server" ID="lblAptNo" />
                </div>

                <div class="form-group">
                    <label for="street">Street</label>
                    <br />
                    <asp:Label runat="server" ID="lblStreet" />
                </div>

                <div class="form-group">
                    <label for="zipCode">Zip Code</label>
                    <br />
                    <asp:Label runat="server" ID="lblZip" />
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <br />
                    <asp:Label runat="server" ID="lblCity" />
                </div>

                

            </div>
        </div>
    </div>
</asp:Content>
