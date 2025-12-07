<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="energyDashboard.aspx.cs" Inherits="roaahub.energyDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <!DOCTYPE html>
    <html dir="ltr" lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Energy Management Dashboard - RoaaHub</title>
        <style>
            :root {
                --primary-color: #ff9800;
                --secondary-color: #ffb74d;
                --success-color: #4caf50;
                --warning-color: #ffc107;
                --danger-color: #f44336;
                --info-color: #2196f3;
                --solar-color: #ff9800;
                --wind-color: #4caf50;
                --battery-color: #9c27b0;
                --grid-color: #607d8b;
                --light-bg: #f8f9fa;
                --dark-text: #333;
                --gray-text: #666;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .dashboard-container {
                background: #f5f7fb;
                min-height: 100vh;
            }

            .dashboard-header {
                background: white;
                padding: 20px 30px;
                border-bottom: 1px solid #e1e5e9;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header-left h1 {
                color: var(--dark-text);
                font-size: 24px;
                font-weight: 600;
            }

            .header-actions {
                display: flex;
                gap: 15px;
            }

            .btn {
                padding: 8px 16px;
                border: none;
                border-radius: 6px;
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.3s;
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .btn-primary {
                background: var(--primary-color);
                color: white;
            }

            .btn-outline {
                background: transparent;
                border: 1px solid var(--primary-color);
                color: var(--primary-color);
            }

            .dashboard-content {
                padding: 20px;
                display: grid;
                grid-template-columns: 1fr 400px;
                gap: 20px;
            }

            .main-content {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .widget {
                background: white;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .widget-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .widget-title {
                font-size: 18px;
                font-weight: 600;
                color: var(--dark-text);
            }

            .stats-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 15px;
                margin-bottom: 20px;
            }

            .stat-card {
                background: var(--light-bg);
                padding: 15px;
                border-radius: 8px;
                text-align: center;
                border-left: 4px solid var(--primary-color);
            }

            .stat-number {
                font-size: 24px;
                font-weight: 700;
                color: var(--primary-color);
                margin-bottom: 5px;
            }

            .stat-label {
                font-size: 14px;
                color: var(--gray-text);
            }

            .sites-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 15px;
            }

            .site-card {
                border: 1px solid #e1e5e9;
                border-radius: 8px;
                padding: 15px;
                background: white;
                position: relative;
            }

            .site-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .site-info h4 {
                font-size: 16px;
                font-weight: 600;
                color: var(--dark-text);
            }

            .site-type {
                padding: 4px 8px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 500;
            }

            .type-solar { background: #fff3e0; color: var(--solar-color); }
            .type-wind { background: #e8f5e8; color: var(--wind-color); }
            .type-industrial { background: #f3e5f5; color: var(--battery-color); }
            .type-commercial { background: #e3f2fd; color: var(--info-color); }
            .type-storage { background: #fce4ec; color: #e91e63; }

            .energy-gauge {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                background: conic-gradient(var(--success-color) 0% 75%, #e1e5e9 75% 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 10px auto;
                position: relative;
            }

            .energy-gauge::before {
                content: '';
                width: 60px;
                height: 60px;
                background: white;
                border-radius: 50%;
                position: absolute;
            }

            .energy-value {
                position: relative;
                z-index: 1;
                font-weight: 700;
                font-size: 16px;
            }

            .site-details {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 10px;
                font-size: 14px;
            }

            .detail-item {
                display: flex;
                justify-content: space-between;
            }

            .detail-label {
                color: var(--gray-text);
            }

            .detail-value {
                font-weight: 500;
            }

            .alerts-list {
                max-height: 400px;
                overflow-y: auto;
            }

            .alert-item {
                padding: 12px;
                border-left: 4px solid var(--warning-color);
                background: #fff8e6;
                margin-bottom: 10px;
                border-radius: 4px;
            }

            .alert-item.high { border-left-color: var(--danger-color); background: #fef0f0; }
            .alert-item.medium { border-left-color: var(--warning-color); background: #fff8e6; }
            .alert-item.low { border-left-color: var(--info-color); background: #e6f3f7; }

            .alert-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 5px;
            }

            .alert-type {
                font-weight: 600;
                font-size: 14px;
            }

            .alert-severity {
                font-size: 12px;
                padding: 2px 6px;
                border-radius: 8px;
                background: rgba(0,0,0,0.1);
            }

            .alert-message {
                font-size: 13px;
                color: var(--gray-text);
            }

            .table {
                width: 100%;
                border-collapse: collapse;
            }

            .table th, .table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #e1e5e9;
            }

            .table th {
                font-weight: 600;
                color: var(--gray-text);
                font-size: 14px;
            }

            .badge {
                padding: 4px 8px;
                border-radius: 4px;
                font-size: 12px;
                font-weight: 500;
            }

            .badge-success { background: #e7f7ef; color: var(--success-color); }
            .badge-warning { background: #fff8e6; color: var(--warning-color); }
            .badge-danger { background: #fef0f0; color: var(--danger-color); }
            .badge-info { background: #e6f3f7; color: var(--info-color); }
            .badge-primary { background: #fff3e0; color: var(--primary-color); }

            .chart-container {
                height: 200px;
                background: #f8f9fa;
                border-radius: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--gray-text);
                margin: 15px 0;
            }

            .sidebar {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .progress-bar {
                height: 8px;
                background: #e1e5e9;
                border-radius: 4px;
                overflow: hidden;
                margin: 10px 0;
            }

            .progress-fill {
                height: 100%;
                background: var(--primary-color);
                border-radius: 4px;
            }

            .carbon-card {
                background: linear-gradient(135deg, var(--success-color), #66bb6a);
                color: white;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 15px;
            }

            .carbon-amount {
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 5px;
            }

            .carbon-label {
                font-size: 14px;
                opacity: 0.9;
            }

            .energy-source-tag {
                display: inline-block;
                padding: 4px 8px;
                background: var(--light-bg);
                border-radius: 12px;
                font-size: 11px;
                color: var(--gray-text);
                margin-right: 5px;
            }

            .live-data {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 10px;
                margin-top: 10px;
            }

            .data-item {
                text-align: center;
                padding: 8px;
                background: #f8f9fa;
                border-radius: 6px;
            }

            .data-value {
                font-weight: 700;
                font-size: 16px;
                color: var(--primary-color);
            }

            .data-label {
                font-size: 12px;
                color: var(--gray-text);
            }

            .battery-status {
                width: 100px;
                height: 40px;
                background: #e1e5e9;
                border-radius: 20px;
                margin: 10px auto;
                position: relative;
                overflow: hidden;
            }

            .battery-fill {
                height: 100%;
                background: var(--success-color);
                border-radius: 20px;
                transition: width 0.3s;
            }

            .battery-text {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-weight: 600;
                font-size: 12px;
                color: white;
                text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
            }
        </style>
    </head>
    <body>
        <div class="dashboard-container">
            <!-- Header -->
            <div class="dashboard-header">
                <div class="header-left">
                    <h1>Energy Management Dashboard</h1>
                </div>
                <div class="header-actions">
                    <button class="btn btn-outline">
                        <i>📊</i> Energy Reports
                    </button>
                    <button class="btn btn-primary">
                        <i>➕</i> Add Site
                    </button>
                </div>
            </div>

            <!-- Main Content -->
            <div class="dashboard-content">
                <!-- Left Column -->
                <div class="main-content">
                    <!-- Energy Overview -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Energy Overview</h3>
                            <div class="filters">
                                <select class="form-control" style="width: 150px;">
                                    <option>All Sites</option>
                                    <option>Renewable Only</option>
                                    <option>Consumption Only</option>
                                </select>
                            </div>
                        </div>
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-number" id="totalGeneration" runat="server">28.5</div>
                                <div class="stat-label">Generation (MW)</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="totalConsumption" runat="server">3.3</div>
                                <div class="stat-label">Consumption (MW)</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="renewablePercentage" runat="server">78%</div>
                                <div class="stat-label">Renewable %</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="carbonSaved" runat="server">21.0</div>
                                <div class="stat-label">CO₂ Saved (tons)</div>
                            </div>
                        </div>
                    </div>

                    <!-- Site Management -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Site Management</h3>
                            <button class="btn btn-outline btn-sm">Refresh</button>
                        </div>
                        <div class="chart-container">
                            📈 Live Energy Flow Diagram
                        </div>
                        <div class="sites-grid" style="margin-top: 15px;">
                            <asp:Repeater ID="rptSites" runat="server">
                                <ItemTemplate>
                                    <div class="site-card">
                                        <div class="site-header">
                                            <div class="site-info">
                                                <h4><%# Eval("SiteName") %></h4>
                                                <div style="font-size: 12px; color: var(--gray-text);">
                                                    <span class="energy-source-tag"><%# Eval("SiteCode") %></span>
                                                    <%# Eval("SiteType") %>
                                                </div>
                                            </div>
                                            <div class='site-type type-<%# GetSiteTypeClass(Eval("SiteType").ToString()) %>'>
                                                <%# Eval("SiteType") %>
                                            </div>
                                        </div>
                                        <div class="energy-gauge">
                                            <div class="energy-value"><%# Eval("Efficiency") %>%</div>
                                        </div>
                                        <div class="site-details">
                                            <div class="detail-item">
                                                <span class="detail-label">Output:</span>
                                                <span class="detail-value"><%# Eval("PowerOutput") %> kW</span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Capacity:</span>
                                                <span class="detail-value"><%# Eval("OperationalCapacity") %> kW</span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Location:</span>
                                                <span class="detail-value"><%# Eval("Location") %></span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Status:</span>
                                                <span class="detail-value"><%# Eval("Status") %></span>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Recent Generation -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Recent Generation Data</h3>
                            <button class="btn btn-outline btn-sm">View All</button>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Site</th>
                                    <th>Type</th>
                                    <th>Power Output</th>
                                    <th>Energy Produced</th>
                                    <th>Efficiency</th>
                                    <th>Timestamp</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptGeneration" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("SiteName") %></td>
                                            <td><span class='badge badge-<%# GetSiteTypeBadge(Eval("SiteType").ToString()) %>'><%# Eval("SiteType") %></span></td>
                                            <td><%# Eval("PowerOutput") %> kW</td>
                                            <td><%# Eval("EnergyProduced") %> kWh</td>
                                            <td><%# Eval("Efficiency") %>%</td>
                                            <td><%# Eval("Timestamp", "{0:MMM dd HH:mm}") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Right Sidebar -->
                <div class="sidebar">
                    <!-- Carbon Savings -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Carbon Savings</h3>
                        </div>
                        <div class="carbon-card">
                            <div class="carbon-amount">21.0 tons</div>
                            <div class="carbon-label">CO₂ Saved Today</div>
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                            <div class="stat-card">
                                <div class="stat-number">+12%</div>
                                <div class="stat-label">vs Last Month</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number">45.8k</div>
                                <div class="stat-label">Total Saved</div>
                            </div>
                        </div>
                    </div>

                    <!-- Energy Alerts -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Energy Alerts</h3>
                            <span class="badge badge-danger" id="alertCount" runat="server">3</span>
                        </div>
                        <div class="alerts-list">
                            <asp:Repeater ID="rptAlerts" runat="server">
                                <ItemTemplate>
                                    <div class='alert-item <%# Eval("Severity").ToString().ToLower() %>'>
                                        <div class="alert-header">
                                            <div class="alert-type"><%# Eval("AlertType") %></div>
                                            <div class="alert-severity"><%# Eval("Severity") %></div>
                                        </div>
                                        <div class="alert-message"><%# Eval("AlertMessage") %></div>
                                        <div style="font-size: 11px; margin-top: 5px; color: var(--gray-text);">
                                            <%# Eval("SiteName") %> | <%# Eval("CreatedDate", "{0:MMM dd, HH:mm}") %>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Battery Storage -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Battery Storage</h3>
                            <button class="btn btn-outline btn-sm">Manage</button>
                        </div>
                        <div style="text-align: center;">
                            <div class="battery-status">
                                <div class="battery-fill" style="width: 76%;"></div>
                                <div class="battery-text">76%</div>
                            </div>
                            <div style="margin-top: 10px; font-size: 14px; color: var(--gray-text);">
                                State of Charge
                            </div>
                        </div>
                        <div style="margin-top: 15px;">
                            <div class="detail-item">
                                <span class="detail-label">Capacity:</span>
                                <span class="detail-value">2,000 kWh</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Current Charge:</span>
                                <span class="detail-value">1,520 kWh</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Health:</span>
                                <span class="detail-value">Good</span>
                            </div>
                        </div>
                    </div>

                    <!-- Live Data -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Live System Data</h3>
                        </div>
                        <div class="live-data">
                            <div class="data-item">
                                <div class="data-value">0.92</div>
                                <div class="data-label">Power Factor</div>
                            </div>
                            <div class="data-item">
                                <div class="data-value">32.5°C</div>
                                <div class="data-label">Ambient Temp</div>
                            </div>
                            <div class="data-item">
                                <div class="data-value">850 W/m²</div>
                                <div class="data-label">Irradiance</div>
                            </div>
                            <div class="data-item">
                                <div class="data-value">12.5 m/s</div>
                                <div class="data-label">Wind Speed</div>
                            </div>
                        </div>
                        <div style="margin-top: 15px;">
                            <div class="detail-item">
                                <span class="detail-label">Grid Frequency:</span>
                                <span class="detail-value">60.01 Hz</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Voltage:</span>
                                <span class="detail-value">380.5 V</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>