<%@ Page Title="Platform" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="platform.aspx.cs" Inherits="roaahub.platform" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Roaahub Platform</h1>
            <p class="lead">Integrated IoT Platform with Multiple Specialized Modules</p>
        </div>
    </section>

    <!-- Platform Overview -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center mb-5">
                    <h2>One Platform, Multiple Solutions</h2>
                    <p class="lead">All modules interconnected through Core Back-end, APIs, and Shared Database</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <h3>Platform Architecture</h3>
                    <p>Our platform consists of several specialized modules, each designed for specific industry needs while sharing a common infrastructure.</p>
                    
                    <div class="roaahub-feature-box mt-4">
                        <h4>Core Components</h4>
                        <ul>
                            <li><strong>Core Back-end:</strong> Centralized data processing and business logic</li>
                            <li><strong>API Layer:</strong> RESTful APIs for seamless integration</li>
                            <li><strong>Shared Database:</strong> Unified data storage and management</li>
                            <li><strong>Real-time Engine:</strong> Live data processing and notifications</li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <img src="https://via.placeholder.com/600x400/3498db/ffffff?text=Platform+Architecture" alt="Platform Architecture" class="roaahub-responsive-img" style="border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);" />
                </div>
            </div>

            <!-- Modules Grid -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3 class="text-center mb-4">Our Specialized Modules</h3>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🚗</div>
                        <h4>ROAA - FLEET</h4>
                        <p>Complete fleet management with real-time tracking and AI-powered insights</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">❄️</div>
                        <h4>ROAA - COLD CHAIN</h4>
                        <p>End-to-end temperature monitoring for sensitive products</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🌴</div>
                        <h4>ROAA - PALM</h4>
                        <p>Early detection of Red Palm Weevil with 95% accuracy</p>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🏗️</div>
                        <h4>ROAA - DOZR</h4>
                        <p>Unified asset tracking for heavy equipment</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">⚡</div>
                        <h4>ROAA - ENERGY</h4>
                        <p>Comprehensive energy monitoring and management</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">📦</div>
                        <h4>FRESH TRACKING</h4>
                        <p>Specialized food tracking with multi-temperature monitoring</p>
                    </div>
                </div>
            </div>

            <!-- Technical Features -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h3 class="text-center mb-4">Technical Capabilities</h3>
                </div>
                
                <div class="col-md-6">
                    <div class="roaahub-feature-box">
                        <h4>Back-end Features</h4>
                        <ul>
                            <li>GPS data storage and processing</li>
                            <li>Sensor data ingestion and analysis</li>
                            <li>AI/ML models for predictive maintenance</li>
                            <li>Real-time alert engine</li>
                            <li>API connectors for ERP/CRM integration</li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="roaahub-feature-box">
                        <h4>Front-end Features</h4>
                        <ul>
                            <li>Interactive maps and live updates</li>
                            <li>Real-time dashboards and visualizations</li>
                            <li>Multi-language support (Arabic/English)</li>
                            <li>Responsive design for all devices</li>
                            <li>User-friendly interface for all user types</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- CTA Section -->
            <div class="row mt-5">
                <div class="col-md-12 text-center">
                    <h3>Ready to Experience Our Platform?</h3>
                    <p class="lead">See how our integrated IoT platform can transform your operations</p>
                    <div class="mt-4">
                        <a runat="server" href="~/requestDemo.aspx" class="roaahub-btn-primary" style="margin-right: 15px;">Request Platform Demo</a>
                        <a runat="server" href="~/contact.aspx" class="roaahub-btn-outline">Contact Sales</a>
                        <a runat="server" href="dashboard.aspx" class="roaahub-btn-outline"> Simple platform </a>
                        <a runat="server" href="testDashboard.aspx" class="roaahub-btn-outline"> Fast Test Dashboard </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>