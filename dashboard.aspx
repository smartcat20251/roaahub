<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="roaahub.dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Dashboard</h1>
            <p class="lead">Welcome to your Roaahub control panel, <asp:Literal ID="litUserName" runat="server" />!</p>
            <div class="user-info-badge">
                <span class="badge bg-primary"><asp:Literal ID="litUserType" runat="server" /></span>
                <span class="badge bg-secondary"><asp:Literal ID="litCompanyName" runat="server" /></span>
            </div>
        </div>
    </section>

    <!-- Dashboard Content -->
    <section class="roaahub-section">
        <div class="container">
            <!-- User Welcome Message -->
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="alert alert-info">
                        <h4><i class="fas fa-user-circle"></i> Welcome, <asp:Literal ID="litUserFullName" runat="server" />!</h4>
                        <p>You are logged in as <strong><asp:Literal ID="litUserRole" runat="server" /></strong> from <strong><asp:Literal ID="litUserCompany" runat="server" /></strong>. 
                           Last login: <asp:Literal ID="litLastLogin" runat="server" /></p>
                    </div>
                </div>
            </div>

            <!-- Services Platforms -->
            <div class="row mb-5">
                <div class="col-md-12">
                    <h2 class="text-center mb-4">Our Services Platforms</h2>
                    <p class="text-center lead">Access specialized IoT solutions tailored for your business needs</p>
                </div>
                
                <!-- ROAA - FLEET Platform -->
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center platform-card">
                        <div class="platform-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <h3>ROAA - FLEET</h3>
                        <p>Complete fleet management with real-time tracking and AI-powered insights</p>
                        <div class="platform-stats">
                            <div class="stat-item">
                                <span class="stat-number">15</span>
                                <span class="stat-label">Active Vehicles</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">98%</span>
                                <span class="stat-label">Uptime</span>
                            </div>
                        </div>
                        <div class="platform-actions mt-3">
                            <a href="fleet.aspx" class="roaahub-btn-primary btn-sm me-2">Manage Fleet</a>
                            <a href="fleet.aspx?view=analytics" class="roaahub-btn-outline btn-sm">Analytics</a>
                        </div>
                    </div>
                </div>
                
                <!-- ROAA - COLD CHAIN Platform -->
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center platform-card">
                        <div class="platform-icon">
                            <i class="fas fa-temperature-low"></i>
                        </div>
                        <h3>ROAA - COLD CHAIN</h3>
                        <p>End-to-end temperature monitoring for sensitive products and pharmaceuticals</p>
                        <div class="platform-stats">
                            <div class="stat-item">
                                <span class="stat-number">24/7</span>
                                <span class="stat-label">Monitoring</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">0</span>
                                <span class="stat-label">Incidents</span>
                            </div>
                        </div>
                        <div class="platform-actions mt-3">
                            <a href="coldchain.aspx" class="roaahub-btn-primary btn-sm me-2">Monitor</a>
                            <a href="coldchain.aspx?view=reports" class="roaahub-btn-outline btn-sm">Reports</a>
                        </div>
                    </div>
                </div>
                
                <!-- ROAA - PALM Platform -->
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center platform-card">
                        <div class="platform-icon">
                            <i class="fas fa-tree"></i>
                        </div>
                        <h3>ROAA - PALM</h3>
                        <p>Early detection of Red Palm Weevil with 95% accuracy using acoustic sensors</p>
                        <div class="platform-stats">
                            <div class="stat-item">
                                <span class="stat-number">95%</span>
                                <span class="stat-label">Accuracy</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">1.2K</span>
                                <span class="stat-label">Palms Monitored</span>
                            </div>
                        </div>
                        <div class="platform-actions mt-3">
                            <a href="palm.aspx" class="roaahub-btn-primary btn-sm me-2">View Farm</a>
                            <a href="palm.aspx?view=alerts" class="roaahub-btn-outline btn-sm">Alerts</a>
                        </div>
                    </div>
                </div>
                
                <!-- ROAA - ENERGY Platform -->
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center platform-card">
                        <div class="platform-icon">
                            <i class="fas fa-bolt"></i>
                        </div>
                        <h3>ROAA - ENERGY</h3>
                        <p>Comprehensive energy monitoring and management for generators and batteries</p>
                        <div class="platform-stats">
                            <div class="stat-item">
                                <span class="stat-number">15%</span>
                                <span class="stat-label">Savings</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">100%</span>
                                <span class="stat-label">Uptime</span>
                            </div>
                        </div>
                        <div class="platform-actions mt-3">
                            <a href="energy.aspx" class="roaahub-btn-primary btn-sm me-2">Monitor</a>
                            <a href="energy.aspx?view=analytics" class="roaahub-btn-outline btn-sm">Analytics</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Stats Overview -->
            <div class="row mb-4">
                <div class="col-md-12">
                    <h3>Overall System Overview</h3>
                </div>
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="stat-number">15</div>
                        <h4>Active Vehicles</h4>
                        <p class="text-success">+2 this week</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="stat-number">98%</div>
                        <h4>System Uptime</h4>
                        <p class="text-success">Excellent</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="stat-number">3</div>
                        <h4>Active Alerts</h4>
                        <p class="text-warning">Needs attention</p>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="stat-number">24/7</div>
                        <h4>Monitoring</h4>
                        <p class="text-info">All systems operational</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3>Quick Actions</h3>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🚗</div>
                        <h4>Fleet Management</h4>
                        <p>View and manage your vehicles</p>
                        <a href="fleet.aspx" class="roaahub-btn-outline btn-sm">Manage</a>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">📊</div>
                        <h4>Reports</h4>
                        <p>Generate performance reports</p>
                        <a href="reports.aspx" class="roaahub-btn-outline btn-sm">View</a>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">⚙️</div>
                        <h4>Settings</h4>
                        <p>Configure your account</p>
                        <a href="settings.aspx" class="roaahub-btn-outline btn-sm">Configure</a>
                    </div>
                </div>
                
                <div class="col-md-3">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🆘</div>
                        <h4>Support</h4>
                        <p>Get help and documentation</p>
                        <a href="contact.aspx" class="roaahub-btn-outline btn-sm">Contact</a>
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="row mt-4">
                <div class="col-md-8">
                    <div class="roaahub-feature-box">
                        <h3>Recent Activity</h3>
                        <div class="list-group">
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Vehicle #VH-001 Maintenance</h5>
                                    <small>2 hours ago</small>
                                </div>
                                <p class="mb-1">Scheduled maintenance completed successfully</p>
                                <small class="text-success">Status: Completed</small>
                            </div>
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Temperature Alert</h5>
                                    <small>5 hours ago</small>
                                </div>
                                <p class="mb-1">Cold chain temperature exceeded threshold in Truck #TC-005</p>
                                <small class="text-warning">Status: Resolved</small>
                            </div>
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">New Vehicle Added</h5>
                                    <small>1 day ago</small>
                                </div>
                                <p class="mb-1">Vehicle #VH-015 added to fleet</p>
                                <small class="text-info">Status: Active</small>
                            </div>
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between">
                                    <h5 class="mb-1">Palm Farm Scan</h5>
                                    <small>1 day ago</small>
                                </div>
                                <p class="mb-1">Completed routine scan of palm plantation - No threats detected</p>
                                <small class="text-success">Status: Healthy</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- System Status -->
                <div class="col-md-4">
                    <div class="roaahub-feature-box">
                        <h3>System Status</h3>
                        <div class="system-status">
                            <div class="status-item">
                                <span class="status-indicator online"></span>
                                <span class="status-label">Fleet Tracking</span>
                                <span class="status-value">Online</span>
                            </div>
                            <div class="status-item">
                                <span class="status-indicator online"></span>
                                <span class="status-label">Cold Chain Monitoring</span>
                                <span class="status-value">Online</span>
                            </div>
                            <div class="status-item">
                                <span class="status-indicator online"></span>
                                <span class="status-label">Palm Monitoring</span>
                                <span class="status-value">Online</span>
                            </div>
                            <div class="status-item">
                                <span class="status-indicator online"></span>
                                <span class="status-label">Energy Management</span>
                                <span class="status-value">Online</span>
                            </div>
                            <div class="status-item">
                                <span class="status-indicator online"></span>
                                <span class="status-label">Database</span>
                                <span class="status-value">Online</span>
                            </div>
                        </div>
                        
                        <div class="mt-4">
                            <h4>Quick Links</h4>
                            <div class="quick-links">
                                <a href="requestDemo.aspx" class="quick-link-item">
                                    <i class="fas fa-desktop"></i>
                                    <span>Request Additional Demo</span>
                                </a>
                                <a href="documentation.aspx" class="quick-link-item">
                                    <i class="fas fa-book"></i>
                                    <span>Documentation</span>
                                </a>
                                <a href="training.aspx" class="quick-link-item">
                                    <i class="fas fa-graduation-cap"></i>
                                    <span>Training Materials</span>
                                </a>
                                <a href="contact.aspx" class="quick-link-item">
                                    <i class="fas fa-headset"></i>
                                    <span>Contact Support</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <style>
        .platform-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        
        .platform-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .platform-icon {
            font-size: 2.5rem;
            color: #3498db;
            margin-bottom: 15px;
        }
        
        .platform-stats {
            display: flex;
            justify-content: space-around;
            margin: 15px 0;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .platform-actions {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        
        .user-info-badge {
            margin-top: 15px;
        }
        
        .user-info-badge .badge {
            margin: 0 5px;
            font-size: 0.8rem;
        }
        
        .system-status {
            margin-top: 15px;
        }
        
        .status-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        .status-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 10px;
        }
        
        .status-indicator.online {
            background-color: #28a745;
        }
        
        .status-indicator.offline {
            background-color: #dc3545;
        }
        
        .status-label {
            flex: 1;
            font-weight: 500;
        }
        
        .status-value {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .quick-links {
            margin-top: 10px;
        }
        
        .quick-link-item {
            display: flex;
            align-items: center;
            padding: 8px 0;
            color: #333;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .quick-link-item:hover {
            color: #3498db;
            text-decoration: none;
        }
        
        .quick-link-item i {
            width: 20px;
            margin-right: 10px;
            color: #3498db;
        }
        
        @media (max-width: 768px) {
            .platform-actions {
                flex-direction: column;
            }
            
            .platform-stats {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</asp:Content>