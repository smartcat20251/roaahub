<%@ Page Title="ROAA - COLD CHAIN" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="coldchain.aspx.cs" Inherits="roaahub.coldchain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>ROAA - COLD CHAIN</h1>
            <p class="lead">End-to-End Temperature Monitoring for Sensitive Products</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>Complete Cold Chain Monitoring</h2>
                    <p>Monitor everything that could affect temperature-sensitive products throughout the entire supply chain cycle with our end-to-end solution.</p>
                    
                    <h3>Key Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <ul>
                                <li>Environmental Monitoring (temperature, humidity, light)</li>
                                <li>Compressor Health Analysis</li>
                                <li>Service Request Automation</li>
                                <li>Door Utilization Monitoring</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul>
                                <li>Location and Movement Detection</li>
                                <li>Real-time Alerts and Notifications</li>
                                <li>Compliance Reporting</li>
                                <li>Multi-zone Temperature Monitoring</li>
                            </ul>
                        </div>
                    </div>

                    <h3>Supporting Model</h3>
                    <div class="row">
                        <div class="col-md-4">
                            <h4>Supply & Production</h4>
                            <p>Warehouses, Cold Rooms, Packaging Areas</p>
                        </div>
                        <div class="col-md-4">
                            <h4>Distribution & Delivery</h4>
                            <p>Food trucks, vaccine vans, medicine transport</p>
                        </div>
                        <div class="col-md-4">
                            <h4>Dispensing & Shelf-Ready</h4>
                            <p>Retail shops, restaurants, pharmacies, hospitals</p>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="service-inquiry mt-5">
                        <h3>Request Cold Chain Solution</h3>
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
                                <label class="control-label">Industry</label>
                                <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Pharmaceutical" Value="pharma"></asp:ListItem>
                                    <asp:ListItem Text="Food & Beverage" Value="food"></asp:ListItem>
                                    <asp:ListItem Text="Healthcare" Value="healthcare"></asp:ListItem>
                                    <asp:ListItem Text="Logistics" Value="logistics"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your cold chain requirements..."></asp:TextBox>
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
                                <li>Prevent product spoilage</li>
                                <li>Ensure regulatory compliance</li>
                                <li>Reduce operational costs</li>
                                <li>Improve supply chain visibility</li>
                                <li>Automate quality control</li>
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