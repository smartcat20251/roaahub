<%@ Page Title="Dozr Equipment Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="dozrDashboard.aspx.cs" Inherits="roaahub.dozrDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
    <html dir="ltr" lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Dozr Equipment Dashboard - RoaaHub</title>
        <style>
            :root {
                --primary-color: #667eea;
                --secondary-color: #764ba2;
                --success-color: #28a745;
                --warning-color: #ffc107;
                --danger-color: #dc3545;
                --info-color: #17a2b8;
                --equipment-color: #ff9800;
                --rental-color: #9c27b0;
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
                background: var(--equipment-color);
                color: white;
            }

            .btn-outline {
                background: transparent;
                border: 1px solid var(--equipment-color);
                color: var(--equipment-color);
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
                border-left: 4px solid var(--equipment-color);
            }

            .stat-number {
                font-size: 24px;
                font-weight: 700;
                color: var(--equipment-color);
                margin-bottom: 5px;
            }

            .stat-label {
                font-size: 14px;
                color: var(--gray-text);
            }

            .equipment-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 15px;
            }

            .equipment-card {
                border: 1px solid #e1e5e9;
                border-radius: 8px;
                padding: 15px;
                background: white;
                position: relative;
            }

            .equipment-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .equipment-info h4 {
                font-size: 16px;
                font-weight: 600;
                color: var(--dark-text);
            }

            .equipment-status {
                padding: 4px 8px;
                border-radius: 12px;
                font-size: 12px;
                font-weight: 500;
            }

            .status-available { background: #e7f7ef; color: var(--success-color); }
            .status-rented { background: #e6f3f7; color: var(--info-color); }
            .status-maintenance { background: #fff8e6; color: var(--warning-color); }
            .status-inactive { background: #fef0f0; color: var(--danger-color); }

            .utilization-gauge {
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

            .utilization-gauge::before {
                content: '';
                width: 60px;
                height: 60px;
                background: white;
                border-radius: 50%;
                position: absolute;
            }

            .utilization-value {
                position: relative;
                z-index: 1;
                font-weight: 700;
                font-size: 16px;
            }

            .equipment-details {
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
            .badge-primary { background: #e6e7ff; color: var(--primary-color); }

            .map-container {
                height: 200px;
                background: #e9ecef;
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
                background: var(--equipment-color);
                border-radius: 4px;
            }

            .category-tag {
                display: inline-block;
                padding: 4px 8px;
                background: var(--light-bg);
                border-radius: 12px;
                font-size: 11px;
                color: var(--gray-text);
                margin-right: 5px;
            }

            .revenue-card {
                background: linear-gradient(135deg, var(--rental-color), #ba68c8);
                color: white;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 15px;
            }

            .revenue-amount {
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 5px;
            }

            .revenue-label {
                font-size: 14px;
                opacity: 0.9;
            }
        </style>
    </head>
    <body>
        <div class="dashboard-container">
            <!-- Header -->
            <div class="dashboard-header">
                <div class="header-left">
                    <h1>Dozr Equipment Management</h1>
                </div>
                <div class="header-actions">
                    <button class="btn btn-outline">
                        <i>📊</i> Equipment Reports
                    </button>
                    <button class="btn btn-primary">
                        <i>➕</i> Add Equipment
                    </button>
                </div>
            </div>

            <!-- Main Content -->
            <div class="dashboard-content">
                <!-- Left Column -->
                <div class="main-content">
                    <!-- Equipment Overview -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Equipment Overview</h3>
                            <div class="filters">
                                <select class="form-control" style="width: 150px;">
                                    <option>All Equipment</option>
                                    <option>Available Only</option>
                                    <option>Rented Equipment</option>
                                </select>
                            </div>
                        </div>
                        <div class="stats-grid">
                            <div class="stat-card">
                                <div class="stat-number" id="totalEquipment" runat="server">12</div>
                                <div class="stat-label">Total Equipment</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="availableEquipment" runat="server">8</div>
                                <div class="stat-label">Available</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="rentedEquipment" runat="server">3</div>
                                <div class="stat-label">Rented</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number" id="utilizationRate" runat="server">78%</div>
                                <div class="stat-label">Utilization Rate</div>
                            </div>
                        </div>
                    </div>

                    <!-- Live Equipment Tracking -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Live Equipment Tracking</h3>
                            <button class="btn btn-outline btn-sm">Refresh</button>
                        </div>
                        <div class="map-container">
                            🗺️ Equipment Location Map
                        </div>
                        <div class="equipment-grid" style="margin-top: 15px;">
                            <asp:Repeater ID="rptEquipment" runat="server">
                                <ItemTemplate>
                                    <div class="equipment-card">
                                        <div class="equipment-header">
                                            <div class="equipment-info">
                                                <h4><%# Eval("EquipmentNumber") %></h4>
                                                <div style="font-size: 12px; color: var(--gray-text);">
                                                    <span class="category-tag"><%# Eval("Category") %></span>
                                                    <%# Eval("EquipmentType") %>
                                                </div>
                                            </div>
                                            <div class='equipment-status status-<%# Eval("Status").ToString().ToLower() %>'>
                                                <%# Eval("Status") %>
                                            </div>
                                        </div>
                                        <div class="utilization-gauge">
                                            <div class="utilization-value"><%# Eval("Utilization") %>%</div>
                                        </div>
                                        <div class="equipment-details">
                                            <div class="detail-item">
                                                <span class="detail-label">Location:</span>
                                                <span class="detail-value"><%# Eval("CurrentLocation") %></span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Hours:</span>
                                                <span class="detail-value"><%# Eval("CurrentHours") %></span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Fuel:</span>
                                                <span class="detail-value"><%# Eval("FuelLevel") %>%</span>
                                            </div>
                                            <div class="detail-item">
                                                <span class="detail-label">Engine:</span>
                                                <span class="detail-value"><%# (bool)Eval("EngineStatus") ? "Running" : "Off" %></span>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Active Rentals -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Active Rentals</h3>
                            <button class="btn btn-outline btn-sm">View All</button>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Equipment</th>
                                    <th>Customer</th>
                                    <th>Project</th>
                                    <th>Duration</th>
                                    <th>Revenue</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptRentals" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("EquipmentNumber") %></td>
                                            <td><%# Eval("CustomerName") %></td>
                                            <td><%# Eval("ProjectName") %></td>
                                            <td><%# Eval("RentalDays") %> days</td>
                                            <td>SAR <%# Eval("TotalCost", "{0:N0}") %></td>
                                            <td><span class='badge badge-<%# GetStatusBadge(Eval("Status").ToString()) %>'><%# Eval("Status") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Right Sidebar -->
                <div class="sidebar">
                    <!-- Revenue Summary -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Revenue Summary</h3>
                        </div>
                        <div class="revenue-card">
                            <div class="revenue-amount">SAR 486,900</div>
                            <div class="revenue-label">Monthly Rental Revenue</div>
                        </div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                            <div class="stat-card">
                                <div class="stat-number">92%</div>
                                <div class="stat-label">Collection Rate</div>
                            </div>
                            <div class="stat-card">
                                <div class="stat-number">15</div>
                                <div class="stat-label">Active Contracts</div>
                            </div>
                        </div>
                    </div>

                    <!-- Equipment Alerts -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Equipment Alerts</h3>
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
                                            <%# Eval("CreatedDate", "{0:MMM dd, yyyy HH:mm}") %>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <!-- Maintenance Schedule -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Maintenance Schedule</h3>
                            <button class="btn btn-outline btn-sm">Schedule</button>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Equipment</th>
                                    <th>Service</th>
                                    <th>Due Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptMaintenance" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("EquipmentNumber") %></td>
                                            <td><%# Eval("MaintenanceType") %></td>
                                            <td><%# Eval("NextServiceDate", "{0:MMM dd, yyyy}") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                    <!-- Fuel Efficiency -->
                    <div class="widget">
                        <div class="widget-header">
                            <h3 class="widget-title">Fuel Efficiency</h3>
                        </div>
                        <div style="text-align: center;">
                            <div class="utilization-gauge" style="width: 100px; height: 100px;">
                                <div class="utilization-value">2.7</div>
                            </div>
                            <div style="margin-top: 10px; font-size: 14px; color: var(--gray-text);">
                                Avg: 2.7 Hours/Liter
                            </div>
                        </div>
                        <div style="margin-top: 15px;">
                            <div class="detail-item">
                                <span class="detail-label">This Month:</span>
                                <span class="detail-value">1,240 L</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Total Cost:</span>
                                <span class="detail-value">SAR 4,960</span>
                            </div>
                            <div class="detail-item">
                                <span class="detail-label">Best Performer:</span>
                                <span class="detail-value">DZ-006 (3.6 H/L)</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>