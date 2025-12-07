<%@ Page Title="ROAA - ENERGY" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="energy.aspx.cs" Inherits="roaahub.energy" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>ROAA - ENERGY</h1>
            <p class="lead">Comprehensive Energy Monitoring and Management Solutions</p>
        </div>
    </section>

    <!-- Service Details -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h2>Smart Energy Management System</h2>
                    <p>Monitor and control all power sources on site to ensure maximum network uptime and optimize energy consumption.</p>
                    
                    <h3>Key Features</h3>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>🔋 Battery Monitoring</h4>
                                <p>Tracks battery health and usage patterns to optimize charging cycles and extend battery lifespan.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>🛢️ Tank Monitoring</h4>
                                <p>Real-time 24x7 data access and analysis on diesel tanks with advanced analytics for refilling and consumption.</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>⚡ Genset Monitoring</h4>
                                <p>Remote generator control with real-time insights into generator's health and performance for uninterrupted operations.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="roaahub-feature-box">
                                <h4>🌡️ Environmental Monitoring</h4>
                                <p>Real-time insights allowing operators to proactively address environmental conditions affecting equipment performance.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="service-inquiry mt-5">
                        <h3>Request Energy Solution</h3>
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
                                <label class="control-label">Energy Needs</label>
                                <asp:CheckBoxList ID="cblEnergyNeeds" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Battery Monitoring" Value="battery"></asp:ListItem>
                                    <asp:ListItem Text="Tank Monitoring" Value="tank"></asp:ListItem>
                                    <asp:ListItem Text="Genset Monitoring" Value="genset"></asp:ListItem>
                                    <asp:ListItem Text="Environmental Monitoring" Value="environmental"></asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Message</label>
                                <asp:TextBox ID="txtInquiryMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" 
                                    placeholder="Tell us about your energy management requirements..."></asp:TextBox>
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
                                <li>Reduce energy costs by up to 30%</li>
                                <li>Prevent equipment failures</li>
                                <li>Optimize fuel consumption</li>
                                <li>Extend equipment lifespan</li>
                                <li>Ensure operational continuity</li>
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