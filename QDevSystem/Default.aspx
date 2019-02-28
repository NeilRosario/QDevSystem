<%@ Page Title="Home" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QDevSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Center the caption in the Carousel */
        .carousel-caption {
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
    <div id="myCarousel" class="carousel slide"
        data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel"
                data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel"
                data-slide-to="1"></li>
            <li data-target="#myCarousel"
                data-slide-to="2"></li>
        </ol>
        <!-- Carousel Images -->
        <div class="carousel-inner" role="listbox">
            <!-- img 1 -->
            <div class="item active">
                <img src="images/BP.jpg" />
                <div class="carousel-caption">
                    <h1>Business Partner?</h1>
                    <p>
                        Looking for an effective way to get applicants for your business? Say no more.
                    </p>
                    <br />
                    <a href="Online Application/RegisterBP.aspx" class="btn btn-success">Get started
                    </a>
                </div>
            </div>
            <!-- img 2 -->
            <div class="item">
                <img src="images/applicant.png" />
                <div class="carousel-caption">
                    <h1>Applicant?</h1>
                    <p>
                        Looking for job oppurtunities? Tired of sending applications left and right? Say no more.
                    </p>
                    <br />
                    <a href="Online Application/RegisterApplicant.aspx" class="btn btn-success">Get in touch with us
                    </a>
                </div>
            </div>
            <!-- img 3 -->
            <div class="item">
                <img src="images/about.jpg" />
                <div class="carousel-caption">
                    <h1>New Visitor?</h1>
                    <p>
                        Curious about us? 
                    </p>
                    <br />
                    <a onclick="$('#contactusModal').modal({'backdrop': 'static'});" class="btn btn-info">Reach out to us
                    </a>
                </div>
            </div>

        </div>
        <!-- Start Slider Controls -->
        <!-- Left Arrow -->
        <a class="left carousel-control" href="#myCarousel" role="button"
            data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <!-- Right Arrow -->
        <a class="right carousel-control" href="#myCarousel" role="button"
            data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="contactusModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding: 35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="glyphicon glyphicon-user"></span> About us</h4>
                </div>
                <div class="modal-body" style="padding: 40px 150px;">
                    <div class="col sm-12">
                        <div class="rows">
                            <div class="control-label">

                                <div class="form-group">
                                    <label for="visit">Social Media</label>
                                    <a href="www.facebook.com/hrqdevmanpower/">www.facebook.com/hrqdevmanpower/
                                    </a>
                                </div>

                                <div class="form-group">
                                    <label for="visit">Telephone</label>
                                    <p>
                                       7118984
                                        
                                    </p>
                                </div>


                                <div class="form-group">
                                    <label for="visit">Visit us</label>
                                    <p>
                                       Room 5B TRP building Gonzalo Puyat st. Quiapo
                                       Manila, Philippines 801
                                        
                                    </p>
                                </div>
                                <div class="form-group">
                                    <label for="visit">Available Hours</label>
                                    <p>
                                      9:00 AM - 5:00 PM    
                                    </p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                        <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">Cancel</button>

                    </div>
            </div>
        </div>
    </div>





</asp:Content>
