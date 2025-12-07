<%@ Page Title="FRESH TRACKING" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="freshTracking.aspx.cs" Inherits="roaahub.freshTracking" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>FRESH TRACKING</h1>
            <p class="lead">Specialized Food Tracking with Multi-Temperature Monitoring</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>Comprehensive Fresh Food Tracking Solution</h2>
                    <p>Advanced tracking and monitoring system specifically designed for fresh food products with HACCP compliance management.</p>
                    
                    <h3>Core Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>🌡️ Real-time Temperature Monitoring</h4>
                                <p>Track temperature and humidity with instant alerts when permissible limits are exceeded.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>🚚 Fleet Management</h4>
                                <p>Control panel for active and inactive vehicles with maintenance status tracking.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>📦 Order & Shipment Management</h4>
                                <p>Record shipment details and track status from en route to delivered.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>👨‍💼 Driver Management</h4>
                                <p>Driver profiles with working hours tracking and behavior monitoring.</p>
                            </div>
                        </div>
                    </div>

                    <h3>Advanced AI Features</h3>
                    <div class="row">
                        <div class="col-md-4">
                            <h5>AI Predictive Maintenance</h5>
                            <p>Predict vehicle delays and maintenance issues before they occur.</p>
                        </div>
                        <div class="col-md-4">
                            <h5>Route Optimization</h5>
                            <p>Analyze distribution routes to reduce fuel consumption and delivery time.</p>
                        </div>
                        <div class="col-md-4">
                            <h5>Multi-Temperature Loads</h5>
                            <p>Manage same truck transporting products with different temperatures.</p>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="service-inquiry mt-5">
                        <h3>Request Fresh Tracking Solution</h3>
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
                                <label class="control-label">Food Type</label>
                                <asp:DropDownList ID="ddlFoodType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Fresh Produce" Value="produce"></asp:ListItem>
                                    <asp:ListItem Text="Dairy Products" Value="dairy"></asp:ListItem>
                                    <asp:ListItem Text="Meat & Poultry" Value="meat"></asp:ListItem>
                                    <asp:ListItem Text="Seafood" Value="seafood"></asp:ListItem>
                                    <asp:ListItem Text="Frozen Foods" Value="frozen"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Number of Vehicles</label>
                                <asp:TextBox ID="txtVehicleCount" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g., 10"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your fresh food tracking needs..."></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSendInquiry" runat="server" Text="Send Inquiry" CssClass="roaahub-btn-primary" OnClick="btnSendInquiry_Click" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="service-sidebar">
                        <div class="roaahub-feature-box">
                            <h4>Compliance Features</h4>
                            <ul>
                                <li>HACCP/ISO22000 compliance tracking</li>
                                <li>Regulatory body reports</li>
                                <li>Quality documents archiving</li>
                                <li>Automated compliance alerts</li>
                                <li>Audit trail documentation</li>
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