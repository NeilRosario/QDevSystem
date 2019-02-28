<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Portals/BP Portal/BP_Portal.Master" AutoEventWireup="true" CodeBehind="EditProfileBP.aspx.cs" Inherits="QDevSystem.Portals.BP_Portal.Profile.EditProfileBP" %>

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
                <asp:Image runat="server" ID="imgCompanyLogoProfile" class="image" />
                <div class="middle">
                </div>

            </div>

            <div class="col-md-6">
                <div>
                </div>
                <div class="form-group">
                    <label for="compName">Company Name</label>
                    <br />
                    <asp:TextBox ID="txtCompanyName" runat="server" class="form-control" type="text" required />
                </div>
                <div class="form-group">
                    <label for="compDesc">Description</label>
                    <br />
                    <asp:TextBox ID="txtCompDesc" runat="server" class="form-control" type="text" TextMode="MultiLine" required />
                </div>
                <div class="form-group">
                    <label for="compAddress">Address</label>
                    <br />
                    <asp:TextBox ID="txtCompAdd" runat="server" class="form-control" type="text" required />
                </div>
                <div class="form-group">
                    <label for="compEmail">Email</label>
                    <br />
                    <asp:TextBox ID="txtCompEmail" runat="server" class="form-control" type="text" required />
                </div>
                <div class="form-group">
                    <label for="compContactNo">Contact #</label>
                    <br />
                    <asp:TextBox ID="txtCompContactNo" runat="server" class="form-control" type="text" required />
                </div>

                <div class="form-group">
                    <label for="compLogo">Update Company Logo</label>
                    <br />
                    <asp:FileUpload ID="FileContent" runat="server" class="form-control" required />
                </div>

                <div class="form-group text-center">
                    <asp:Button ID="btnUpdate" runat="server"
                        Class="btn block btn-success"
                        OnClick="btnUpdate_Click"
                        Text="Update"></asp:Button>
                    <a href="~/Portals/BP Portal/Profile/ProfileBP.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                </div>

            </div>
        </div>



    </div>
</asp:Content>
