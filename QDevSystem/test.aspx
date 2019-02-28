<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="QDevSystem.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <div class="container">
            <div class="col-lg-6">
                <h1>Custom Radio Buttons</h1>
                <div class="form-group">
                    <label class="container">
                    One
  <input type="radio" checked="checked" name="radio">
                    <span class="checkmark"></span>
                </label>
                </div>
                
                <label class="container">
                    Two
  <input type="radio" name="radio">
                    <span class="checkmark"></span>
                </label>
                <label class="container">
                    Three
  <input type="radio" name="radio">
                    <span class="checkmark"></span>
                </label>
                <label class="container">
                    Four
  <input type="radio" name="radio">
                    <span class="checkmark"></span>
                </label>
                
            </div>
        </div>
    </div>
</asp:Content>
