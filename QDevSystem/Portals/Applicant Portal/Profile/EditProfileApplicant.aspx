<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Portals/Applicant Portal/Applicant_Portal.Master" AutoEventWireup="true" CodeBehind="EditProfileApplicant.aspx.cs" Inherits="QDevSystem.Portals.Applicant_Portal.Profile.EditProfileApplicant" %>

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

    <div class="jumbotron">
        <div class="container">
            <div class="col-md-3">
                <asp:Image runat="server" ID="imgApplicantPic" class="image" />
                <br />
                <div class="form-group">
                    <label for="compLogo">Update Profile Picture</label>
                    <br />
                    <asp:FileUpload ID="FileContent" runat="server" class="form-control" required />
                </div>
            </div>


            <div class="col-md-6">
                <div class="form-group">
                    <label for="FN">First Name</label>
                    <br />
                    <asp:TextBox ID="txtFN" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="MN">Middle Name</label>
                    <br />
                    <asp:TextBox ID="txtMN" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="LN">Last Name</label>
                    <br />
                    <asp:TextBox ID="txtLN" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <br />
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <br />
                    <asp:TextBox ID="txtDOB" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="appHomeNo">Home #</label>
                    <br />
                    <asp:TextBox ID="txtHomeNo" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="appMobileNo">Mobile #</label>
                    <br />
                    <asp:TextBox ID="txtMobileNo" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="appAltNo">Alternate #</label>
                    <br />
                    <asp:TextBox ID="txtAltNo" runat="server" class="form-control" type="text" required />
                </div>


                <div class="form-group text-center">
                    <asp:Button ID="btnUpdate" runat="server"
                        Class="btn block btn-success"
                        
                        Text="Update"></asp:Button>

                    <a href="~/Portals/BP Portal/HomeBP.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                </div>

            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <label for="region">Region</label>
                    <br />
                    <asp:DropDownList ID="ddlRegion" runat="server" CssClass="form-control" required />
                </div>
                <div class="form-group">
                    <label for="bldgNo">Bldg #</label>
                    <br />
                    <asp:TextBox ID="txtBldgNo" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="appNo">Apartment #</label>
                    <br />
                    <asp:TextBox ID="txtAptNo" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="street">Street</label>
                    <br />
                    <asp:TextBox ID="txtStreet" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="zipCode">Zip Code</label>
                    <br />
                    <asp:TextBox ID="txtZip" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="city">City</label>
                    <br />
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" type="text" required />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
