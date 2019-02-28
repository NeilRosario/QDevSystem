<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="RegisterBP.aspx.cs" Inherits="QDevSystem.Online_Application.RegisterBP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h2><b>Sign Up</b></h2>
            <br />

            <div class="form-horizontal">
                <div class="panel-body">
                    <div class="rows">
                        <div class="control-label col-lg-7">
                            <asp:Label ID="error" runat="server" ForeColor="#CD3333"
                                Visible="false">
                Email is already Taken!
                            </asp:Label>
                        </div>

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
                                <label class="control-label col-lg-4">Email Address<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtEmail" runat="server"
                                        class="form-control" type="email" MaxLength="30" required />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-lg-4">Password<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtPW" runat="server"
                                        class="form-control" type="password" MaxLength="20" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Company Name<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtCompany" runat="server"
                                        class="form-control" type="text" MaxLength="50"
                                        required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Company Description<span style="color: red;">*</span></label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtCompanyDesc" runat="server"
                                        class="form-control" type="text" MaxLength="500" TextMode="MultiLine"
                                        required />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-lg-4">Company Logo</label>
                                <div class="col-lg-8">
                                    <asp:FileUpload ID="FileContent" runat="server" class="form-control" required />
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <hr />
                                <div class="form-group text-center">
                                    <asp:Button ID="btnApply" runat="server"
                                        CssClass="btn btn-success"
                                        OnClick="btnApply_Click"
                                        Text="Submit" ValidationGroup="Date"></asp:Button>


                                    <a href="../Default.aspx" class="btn btn-secondary">Go Back</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
