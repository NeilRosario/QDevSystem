<%@ Page Title="Edit Job" Language="C#" MasterPageFile="~/Portals/BP Portal/BP_Portal.Master" AutoEventWireup="true" CodeBehind="EditJobBP.aspx.cs" Inherits="QDevSystem.Portals.BP_Portal.Jobs.EditJobBP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="box-body">
        <div class="form-horizontal">
            <br />
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/HomeBP.aspx" runat="server">Home</a></li>
                <li class="breadcrumb-item"><a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server">Job List</a></li>
                <li class="breadcrumb-item">Edit Job</li>
            </ol>
            <div>
                <hr />
            </div>
        </div>
    </div>
    <div class="container">
        <div class="jumbotron">
            <h2>
                <b>
                    <asp:Literal ID="ltJID" runat="server" Visible="true" /></b>

            </h2>
            <div class="form-horizontal">
                <div class="panel-body">
                    <div class="rows">

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="control-label col-lg-4">Job Location</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtJobLocation" runat="server" class="form-control" type="text" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Job Title</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" type="text" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Job Description</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" type="text" MaxLength="500" TextMode="MultiLine" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Monthly Salary</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtSal" runat="server" class="form-control" type="text" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-8">
                                    <asp:RadioButtonList ID="rdStatus" runat="server" CssClass="col-lg-8">
                                        <asp:ListItem Text="Open" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Closed" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <asp:Button ID="btnEdit" runat="server"
                                CssClass="btn btn-success"
                                OnClick="btnEdit_Click"
                                Text="Submit"></asp:Button>

                            <a href="~/Portals/BP Portal/Jobs/ViewJobsBP.aspx" runat="server" class="btn btn-secondary">Go Back</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
