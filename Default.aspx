<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="roaahub._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Roaahub by Smartcat</h1>
            <h2>National IoT & Fleet Tracking Platform</h2>
            <p class="lead">Innovative Tracking & IoT Hub for Saudi Arabia</p>
            <p>A comprehensive platform under Smartcat Company, providing top-tier tracking and IoT solutions for all types of fleets across diverse industries.</p>
            <div class="mt-4">
                <a runat="server" href="~/requestDemo.aspx" class="roaahub-btn-primary">Request Demo</a>
                <a runat="server" href="~/platform.aspx" class="roaahub-btn-outline" style="color:#fff; border-color:#fff; margin-left:15px;">Get Started</a>
            </div>
        </div>
    </section>

    <!-- Services Overview -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row text-center mb-5">
                <div class="col-md-12">
                    <h2>Our Services</h2>
                    <p class="lead">Comprehensive IoT solutions for modern businesses</p>
                </div>
            </div>
            <div class="row">
                <!-- ROAA - FLEET -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🚗</div>
                        <h3>ROAA - FLEET</h3>
                        <p>Complete vehicle tracking and fleet optimization solutions with real-time monitoring and AI-powered insights.</p>
                        <a runat="server" href="~/fleet.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
                <!-- ROAA - COLD CHAIN -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">❄️</div>
                        <h3>ROAA - COLD CHAIN</h3>
                        <p>End-to-end temperature monitoring for sensitive products throughout the entire supply chain cycle.</p>
                        <a runat="server" href="~/coldchain.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
                <!-- ROAA - PALM -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🌴</div>
                        <h3>ROAA - PALM</h3>
                        <p>Early detection of Red Palm Weevil with 95% accuracy using advanced acoustic sensors and AI algorithms.</p>
                        <a runat="server" href="~/palm.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
            </div>
            <!-- Second Row of Services -->
            <div class="row mt-4">
                <!-- ROAA - DOZR -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🏗️</div>
                        <h3>ROAA - DOZR</h3>
                        <p>Unified asset tracking platform for heavy equipment with real-time performance monitoring and utilization insights.</p>
                        <a runat="server" href="~/dozr.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
                <!-- ROAA - ENERGY -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">⚡</div>
                        <h3>ROAA - ENERGY</h3>
                        <p>Comprehensive energy monitoring and management solutions for generators, batteries, and power systems.</p>
                        <a runat="server" href="~/energy.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
                <!-- FRESH TRACKING -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">📦</div>
                        <h3>FRESH TRACKING</h3>
                        <p>Specialized food tracking with multi-temperature monitoring and HACCP compliance management.</p>
                        <a runat="server" href="~/freshTracking.aspx" class="roaahub-btn-outline">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="roaahub-section" style="background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%); color: white;">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3">
                    <div class="stat-number">900+</div>
                    <h4>Active Vehicles Tracked</h4>
                </div>
                <div class="col-md-3">
                    <div class="stat-number">95%</div>
                    <h4>Detection Accuracy</h4>
                </div>
                <div class="col-md-3">
                    <div class="stat-number">24/7</div>
                    <h4>Monitoring Coverage</h4>
                </div>
                <div class="col-md-3">
                    <div class="stat-number">50+</div>
                    <h4>Happy Clients</h4>
                </div>
            </div>
        </div>
    </section>

    <!-- Platform Features -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Why Choose Roaahub?</h2>
                    <p>Our platform offers cutting-edge IoT solutions tailored for the Saudi market, combining global best practices with local expertise.</p>
                    <ul style="list-style-type: none; padding-left: 0;">
                        <li style="padding: 10px 0; border-bottom: 1px solid #eee;">✓ Real-time tracking and monitoring</li>
                        <li style="padding: 10px 0; border-bottom: 1px solid #eee;">✓ Advanced AI and analytics</li>
                        <li style="padding: 10px 0; border-bottom: 1px solid #eee;">✓ Multi-industry specialized solutions</li>
                        <li style="padding: 10px 0; border-bottom: 1px solid #eee;">✓ 24/7 customer support</li>
                        <li style="padding: 10px 0;">✓ Local compliance and regulations</li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <img src="https://via.placeholder.com/600x400/3498db/ffffff?text=Platform+Dashboard" alt="Roaahub Dashboard" class="roaahub-responsive-img" style="border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);" />
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="roaahub-section" style="background-color: #f8f9fa;">
        <div class="container text-center">
            <h2>Ready to Transform Your Operations?</h2>
            <p class="lead">Join leading businesses across Saudi Arabia who trust Roaahub for their IoT and fleet management needs.</p>
            <div class="mt-4">
                <a runat="server" href="~/requestDemo.aspx" class="roaahub-btn-primary" style="margin-right: 15px;">Request Demo</a>
                <a runat="server" href="~/contact.aspx" class="roaahub-btn-outline">Contact Us</a>
            </div>
        </div>
    </section>

</asp:Content>
