<%@ Page Title="ROAA - PALM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="palm.aspx.cs" Inherits="roaahub.palm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>ROAA - PALM</h1>
            <p class="lead">Early Detection of Red Palm Weevil with 95% Accuracy</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>Innovative Palm Protection Solution</h2>
                    <p>Our solution uses acoustic sensors for early detection of Red Palm Weevil (RPW) even before the infection is detectable by humans.</p>
                    
                    <h3>Key Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <ul>
                                <li>Early detection of Red Palm Weevil</li>
                                <li>24/7 infection alarms and monitoring</li>
                                <li>Locate infected palms in large plantations</li>
                                <li>Treatment efficiency monitoring</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul>
                                <li>Infection rate analytics</li>
                                <li>Plantation clusters management</li>
                                <li>Easy installation process</li>
                                <li>Battery-less devices</li>
                            </ul>
                        </div>
                    </div>

                    <h3>Detection Technology</h3>
                    <p>Roaa-Palm analyzes 15+ key parameters using sophisticated algorithms to provide early detection of larvae in early stage with 95% accuracy from day 1.</p>

                    <h3>Challenges We Solve</h3>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="roaahub-feature-box text-center">
                                <h5>Manual Observation</h5>
                                <p>Manual RPW observation and pheromone traps aren't effective</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="roaahub-feature-box text-center">
                                <h5>Chemical Impact</h5>
                                <p>Chemical protection affects product quality</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="roaahub-feature-box text-center">
                                <h5>Treatment Limitations</h5>
                                <p>Infected palms aren't 100% treatable</p>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="service-inquiry mt-5">
                        <h3>Request Palm Solution</h3>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label">Name *</label>
                                <asp:TextBox ID="txtInquiryName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Email *</label>
                                <asp:TextBox ID="txtInquiryEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Your Email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Organization Type</label>
                                <asp:DropDownList ID="ddlOrgType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Palm Farm" Value="farm"></asp:ListItem>
                                    <asp:ListItem Text="Agricultural Company" Value="company"></asp:ListItem>
                                    <asp:ListItem Text="Government Agency" Value="government"></asp:ListItem>
                                    <asp:ListItem Text="Research Institution" Value="research"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Plantation Size (Hectares)</label>
                                <asp:TextBox ID="txtPlantationSize" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g., 100"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your palm plantation needs..."></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSendInquiry" runat="server" Text="Send Inquiry" CssClass="roaahub-btn-primary" OnClick="btnSendInquiry_Click" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="service-sidebar">
                        <div class="roaahub-feature-box">
                            <h4>Solution Benefits</h4>
                            <ul>
                                <li>95% detection accuracy from day 1</li>
                                <li>Early infection detection</li>
                                <li>Reduce palm loss by up to 90%</li>
                                <li>Minimize chemical usage</li>
                                <li>Automated monitoring system</li>
                            </ul>
                        </div>
                        
                        <div class="roaahub-feature-box mt-4">
                            <h4>Quick Contact</h4>
                            <p><strong>Phone:</strong> +966 56 643 9605</p>
                            <p><strong>Email:</strong> info@roaahub.com</p>
                            <asp:Button ID="btnRequestDemo" runat="server" Text="Request Demo" CssClass="roaahub-btn-primary btn-block" OnClick="btnRequestDemo_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>