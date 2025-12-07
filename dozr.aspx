<%@ Page Title="ROAA - DOZR" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dozr.aspx.cs" Inherits="roaahub.dozr" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>ROAA - DOZR</h1>
            <p class="lead">Unified Asset Tracking Platform for Heavy Equipment</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>End-to-End IoT Solution for Heavy Equipment</h2>
                    <p>Track asset performance and operational events in real-time to improve fleet performance with a unified view of all models and years.</p>
                    
                    <h3>Key Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <ul>
                                <li>Unified view of all equipment models</li>
                                <li>Real-time asset performance tracking</li>
                                <li>Operational events monitoring</li>
                                <li>Utilization optimization</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <ul>
                                <li>Executive dashboards for management</li>
                                <li>Site-level detailed analysis</li>
                                <li>Regional breakdown reporting</li>
                                <li>Predictive maintenance alerts</li>
                            </ul>
                        </div>
                    </div>

                    <h3>Our Process</h3>
                    <div class="row text-center mt-4">
                        <div class="col-md-3">
                            <div class="service-icon">📊</div>
                            <h5>GATHER</h5>
                            <p>Collect data from smart sensors</p>
                        </div>
                        <div class="col-md-3">
                            <div class="service-icon">🔗</div>
                            <h5>CONNECT</h5>
                            <p>Internet communication gateway</p>
                        </div>
                        <div class="col-md-3">
                            <div class="service-icon">📈</div>
                            <h5>ANALYZE</h5>
                            <p>Process and analyze data</p>
                        </div>
                        <div class="col-md-3">
                            <div class="service-icon">👁️</div>
                            <h5>SHOW</h5>
                            <p>Display insights on dashboards</p>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="service-inquiry mt-5">
                        <h3>Request DOZR Solution</h3>
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
                                <label class="control-label">Equipment Type</label>
                                <asp:DropDownList ID="ddlEquipmentType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Construction Equipment" Value="construction"></asp:ListItem>
                                    <asp:ListItem Text="Mining Equipment" Value="mining"></asp:ListItem>
                                    <asp:ListItem Text="Agricultural Equipment" Value="agricultural"></asp:ListItem>
                                    <asp:ListItem Text="Industrial Equipment" Value="industrial"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="other"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your equipment tracking needs..."></asp:TextBox>
                            </div>
                            <asp:Button ID="btnSendInquiry" runat="server" Text="Send Inquiry" CssClass="roaahub-btn-primary" OnClick="btnSendInquiry_Click" />
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="service-sidebar">
                        <div class="roaahub-feature-box">
                            <h4>Dashboard Features</h4>
                            <ul>
                                <li>Location status monitoring</li>
                                <li>Utilization status tracking</li>
                                <li>Working hours analysis</li>
                                <li>Detailed alarms information</li>
                                <li>Advanced reporting tools</li>
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