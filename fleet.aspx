<%@ Page Title="ROAA - FLEET" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="fleet.aspx.cs" Inherits="roaahub.fleet" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>ROAA - FLEET</h1>
            <p class="lead">Complete Vehicle Tracking and Fleet Optimization Solutions</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>Comprehensive Fleet Management</h2>
                    <p>Our advanced fleet management solutions provide real-time visibility into your vehicle operations, helping you reduce costs, improve efficiency, and enhance safety.</p>
                    
                    <h3>Key Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <ul>
                                <li>Real-time GPS tracking</li>
                                <li>Fuel consumption monitoring</li>
                                <li>Driver behavior analysis</li>
                                <li>Maintenance scheduling</li>
                                <li>Route optimization</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul>
                                <li>Geofencing alerts</li>
                                <li>Performance reporting</li>
                                <li>Compliance management</li>
                                <li>AI-based predictive maintenance</li>
                                <li>Multi-temperature load management</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Contact Form for Service Inquiry -->
                    <div class="service-inquiry mt-5">
                        <h3>Request More Information</h3>
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
                                <label class="control-label">Company</label>
                                <asp:TextBox ID="txtInquiryCompany" runat="server" CssClass="form-control" placeholder="Your Company"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your fleet management needs..."></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSendInquiry" runat="server" Text="Send Inquiry" CssClass="roaahub-btn-primary" OnClick="btnSendInquiry_Click" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="service-sidebar">
                        <div class="roaahub-feature-box">
                            <h4>Service Benefits</h4>
                            <ul>
                                <li>Reduce fuel costs by up to 15%</li>
                                <li>Improve vehicle utilization</li>
                                <li>Enhance driver safety</li>
                                <li>Reduce maintenance costs</li>
                                <li>Increase operational efficiency</li>
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