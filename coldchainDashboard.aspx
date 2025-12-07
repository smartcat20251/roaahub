<%@ Page Title="Cold Chain Monitoring" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="coldchainDashboard.aspx.cs" Inherits="roaahub.coldchainDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --info-color: #2980b9;
            --cold-color: #4fc3f7;
            --freezer-color: #29b6f6;
            --light-bg: #f8f9fa;
            --dark-text: #2c3e50;
            --gray-text: #7f8c8d;
        }

        .dashboard-container {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .dashboard-header {
            background: white;
            padding: 25px 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-left h1 {
            color: var(--dark-text);
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .welcome-text {
            color: var(--gray-text);
            font-size: 16px;
        }

        .header-actions {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary {
            background: var(--cold-color);
            color: white;
        }

        .btn-primary:hover {
            background: #29b6f6;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 195, 247, 0.4);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--cold-color);
            color: var(--cold-color);
        }

        .btn-outline:hover {
            background: var(--cold-color);
            color: white;
            transform: translateY(-2px);
        }

        .btn-sm {
            padding: 8px 16px;
            font-size: 13px;
        }

        .dashboard-content {
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 25px;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .widget {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .widget:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .widget-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .widget-title {
            font-size: 20px;
            font-weight: 700;
            color: var(--dark-text);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .widget-title i {
            color: var(--cold-color);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 25px;
        }

        .stat-card {
            background: linear-gradient(135deg, var(--light-bg), #e8f4fd);
            padding: 20px;
            border-radius: 12px;
            text-align: center;
            border-left: 4px solid var(--cold-color);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 195, 247, 0.3);
        }

        .stat-number {
            font-size: 28px;
            font-weight: 800;
            color: var(--cold-color);
            margin-bottom: 8px;
        }

        .stat-label {
            font-size: 14px;
            color: var(--gray-text);
            font-weight: 500;
        }

        .units-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .unit-card {
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            padding: 20px;
            background: white;
            transition: all 0.3s ease;
        }

        .unit-card:hover {
            border-color: var(--cold-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(79, 195, 247, 0.2);
        }

        .unit-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .unit-info h4 {
            font-size: 16px;
            font-weight: 700;
            color: var(--dark-text);
            margin-bottom: 5px;
        }

        .unit-type {
            font-size: 13px;
            color: var(--gray-text);
        }

        .unit-actions {
            display: flex;
            gap: 8px;
        }

        .unit-status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            margin-bottom: 15px;
            display: inline-block;
        }

        .status-active { background: #d5f4e6; color: var(--success-color); }
        .status-inactive { background: #fdeaea; color: var(--danger-color); }
        .status-maintenance { background: #fef5e7; color: var(--warning-color); }

        .temperature-gauge {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: conic-gradient(var(--success-color) 0% 70%, #e1e5e9 70% 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 15px auto;
            position: relative;
        }

        .temperature-gauge::before {
            content: '';
            width: 70px;
            height: 70px;
            background: white;
            border-radius: 50%;
            position: absolute;
        }

        .temperature-value {
            position: relative;
            z-index: 1;
            font-weight: 700;
            font-size: 18px;
            color: var(--dark-text);
        }

        .unit-details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            font-size: 14px;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
        }

        .detail-label {
            color: var(--gray-text);
            font-weight: 500;
        }

        .detail-value {
            font-weight: 600;
            color: var(--dark-text);
        }

        .alerts-list {
            max-height: 400px;
            overflow-y: auto;
        }

        .alert-item {
            padding: 15px;
            border-left: 4px solid var(--warning-color);
            background: #fff8e6;
            margin-bottom: 12px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .alert-item:hover {
            transform: translateX(5px);
        }

        .alert-item.high { border-left-color: var(--danger-color); background: #fdeaea; }
        .alert-item.medium { border-left-color: var(--warning-color); background: #fff8e6; }
        .alert-item.low { border-left-color: var(--info-color); background: #e8f4fd; }

        .alert-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .alert-type {
            font-weight: 700;
            font-size: 14px;
            color: var(--dark-text);
        }

        .alert-severity {
            font-size: 11px;
            padding: 4px 8px;
            border-radius: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .alert-message {
            font-size: 13px;
            color: var(--gray-text);
            line-height: 1.4;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e1e5e9;
        }

        .table th {
            font-weight: 600;
            color: var(--gray-text);
            font-size: 14px;
            background: var(--light-bg);
        }

        .badge {
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-success { background: #d5f4e6; color: var(--success-color); }
        .badge-warning { background: #fef5e7; color: var(--warning-color); }
        .badge-danger { background: #fdeaea; color: var(--danger-color); }
        .badge-info { background: #e8f4fd; color: var(--info-color); }

        .temperature-chart {
            height: 200px;
            background: linear-gradient(135deg, #f8f9fa, #e8f4fd);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gray-text);
            margin: 15px 0;
            border: 2px dashed #e1e8ed;
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .temp-indicator {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px;
            border-radius: 8px;
            background: var(--light-bg);
            transition: all 0.3s ease;
        }

        .temp-indicator:hover {
            background: #e8f4fd;
            transform: translateX(5px);
        }

        .temp-color {
            width: 20px;
            height: 20px;
            border-radius: 50%;
        }

        .temp-safe { background: var(--success-color); }
        .temp-warning { background: var(--warning-color); }
        .temp-danger { background: var(--danger-color); }

        .compliance-gauge {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            background: conic-gradient(var(--success-color) 0% 85%, #e1e5e9 85% 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            position: relative;
        }

        .compliance-gauge::before {
            content: '';
            width: 100px;
            height: 100px;
            background: white;
            border-radius: 50%;
            position: absolute;
        }

        .compliance-value {
            position: relative;
            z-index: 1;
            font-weight: 800;
            font-size: 24px;
            color: var(--success-color);
        }

        .quick-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-top: 20px;
        }

        .quick-action-btn {
            background: var(--light-bg);
            border: 2px solid #e1e8ed;
            padding: 12px;
            border-radius: 8px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--dark-text);
            font-size: 13px;
            font-weight: 500;
        }

        .quick-action-btn:hover {
            background: var(--cold-color);
            color: white;
            transform: translateY(-2px);
            border-color: var(--cold-color);
            text-decoration: none;
        }

        .action-buttons {
            display: flex;
            gap: 5px;
        }

        @media (max-width: 1200px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .units-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard-content {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard-header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .header-actions {
                flex-direction: column;
                width: 100%;
            }
            
            .btn {
                width: 100%;
                justify-content: center;
            }
            
            .quick-actions {
                grid-template-columns: 1fr;
            }
            
            .unit-actions {
                flex-direction: column;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container">
        <!-- Header -->
        <div class="dashboard-header">
            <div class="header-left">
                <h1><i class="fas fa-temperature-low"></i> Cold Chain Monitoring</h1>
                <div class="welcome-text">Real-time temperature monitoring and compliance tracking</div>
            </div>
            <div class="header-actions">
                <asp:LinkButton ID="btnReports" runat="server" CssClass="btn btn-outline" OnClick="btnReports_Click">
                    <i class="fas fa-chart-bar"></i> Temperature Reports
                </asp:LinkButton>
                <asp:LinkButton ID="btnAddUnit" runat="server" CssClass="btn btn-primary" OnClick="btnAddUnit_Click">
                    <i class="fas fa-plus"></i> Add New Unit
                </asp:LinkButton>
            </div>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <!-- Left Column -->
            <div class="main-content">
                <!-- Cold Chain Overview -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-snowflake"></i> System Overview</h3>
                        <div class="filters">
                            <asp:DropDownList ID="ddlFilter" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
                                <asp:ListItem Text="All Units" Value="all"></asp:ListItem>
                                <asp:ListItem Text="Active Only" Value="active"></asp:ListItem>
                                <asp:ListItem Text="With Alerts" Value="alerts"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-number" id="totalUnits" runat="server">0</div>
                            <div class="stat-label">Total Units</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="activeUnits" runat="server">0</div>
                            <div class="stat-label">Active Units</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="tempAlerts" runat="server">0</div>
                            <div class="stat-label">Active Alerts</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="complianceRate" runat="server">0%</div>
                            <div class="stat-label">Compliance Rate</div>
                        </div>
                    </div>
                </div>

                <!-- Live Temperature Monitoring -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-thermometer-half"></i> Live Monitoring</h3>
                        <asp:Button ID="btnRefresh" runat="server" CssClass="btn btn-outline btn-sm" Text="Refresh Data" OnClick="btnRefresh_Click" />
                    </div>
                    <div class="temperature-chart">
                        <i class="fas fa-chart-line" style="font-size: 48px; margin-right: 15px;"></i>
                        <div>
                            <div style="font-weight: 600; margin-bottom: 5px;">Live Temperature Trends</div>
                            <div style="font-size: 14px;">Real-time monitoring visualization</div>
                        </div>
                    </div>
                    <div class="units-grid">
                        <asp:Repeater ID="rptUnits" runat="server" OnItemDataBound="rptUnits_ItemDataBound" OnItemCommand="rptUnits_ItemCommand">
                            <ItemTemplate>
                                <div class="unit-card">
                                    <div class="unit-header">
                                        <div class="unit-info">
                                            <h4><%# Eval("UnitName") %></h4>
                                            <div class="unit-type"><%# Eval("UnitType") %></div>
                                        </div>
                                        <div class="unit-actions">
                                            <asp:LinkButton ID="btnEditUnit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("UnitID") %>' CssClass="btn btn-outline btn-sm">
                                                <i class="fas fa-edit"></i> Edit
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDeleteUnit" runat="server" CommandName="Delete" CommandArgument='<%# Eval("UnitID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this unit?');">
                                                <i class="fas fa-trash"></i> Delete
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <asp:Label ID="lblStatus" runat="server" CssClass="unit-status" Text='<%# Eval("Status") %>'></asp:Label>
                                    <div class="temperature-gauge">
                                        <div class="temperature-value">
                                            <asp:Literal ID="ltTemperature" runat="server" Text='<%# Eval("CurrentTemperature", "{0}°C") %>'></asp:Literal>
                                        </div>
                                    </div>
                                    <div class="unit-details">
                                        <div class="detail-item">
                                            <span class="detail-label">Target Temp:</span>
                                            <span class="detail-value"><%# Eval("TargetTemperature", "{0}°C") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Humidity:</span>
                                            <span class="detail-value"><%# Eval("Humidity", "{0}%") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Location:</span>
                                            <span class="detail-value"><%# Eval("Location") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Last Update:</span>
                                            <span class="detail-value"><%# Eval("LastUpdate", "{0:MMM dd, HH:mm}") %></span>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Active Shipments -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-truck"></i> Active Shipments</h3>
                        <asp:LinkButton ID="btnViewAllShipments" runat="server" CssClass="btn btn-outline btn-sm" OnClick="btnViewAllShipments_Click">
                            View All
                        </asp:LinkButton>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Shipment ID</th>
                                    <th>Product Type</th>
                                    <th>Route</th>
                                    <th>Current Temp</th>
                                    <th>Required Temp</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptShipments" runat="server" OnItemDataBound="rptShipments_ItemDataBound">
                                    <ItemTemplate>
                                        <tr>
                                            <td><strong><%# Eval("ShipmentNumber") %></strong></td>
                                            <td><%# Eval("ProductType") %></td>
                                            <td><%# Eval("StartLocation") %> → <%# Eval("EndLocation") %></td>
                                            <td><%# Eval("CurrentTemperature", "{0}°C") %></td>
                                            <td><%# Eval("RequiredTemperature", "{0}°C") %></td>
                                            <td>
                                                <asp:Label ID="lblShipmentStatus" runat="server" CssClass='<%# "badge badge-" + GetStatusBadge(Eval("Status").ToString()) %>' 
                                                          Text='<%# Eval("Status") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Right Sidebar -->
            <div class="sidebar">
                <!-- Temperature Alerts -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-bell"></i> Active Alerts</h3>
                        <asp:Label ID="lblAlertCount" runat="server" CssClass="badge badge-danger" Text="0"></asp:Label>
                    </div>
                    <div class="alerts-list">
                        <asp:Repeater ID="rptAlerts" runat="server" OnItemDataBound="rptAlerts_ItemDataBound">
                            <ItemTemplate>
                                <div class='alert-item <%# Eval("Severity").ToString().ToLower() %>'>
                                    <div class="alert-header">
                                        <div class="alert-type"><%# Eval("AlertType") %></div>
                                        <asp:Label ID="lblSeverity" runat="server" CssClass="alert-severity" Text='<%# Eval("Severity") %>'></asp:Label>
                                    </div>
                                    <div class="alert-message"><%# Eval("Message") %></div>
                                    <div style="font-size: 11px; margin-top: 5px; color: var(--gray-text);">
                                        <i class="fas fa-clock"></i> <%# Eval("CreatedDate", "{0:MMM dd, HH:mm}") %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Label ID="lblNoAlerts" runat="server" CssClass="text-muted" Text="No active alerts" Visible="false" style="padding: 20px; text-align: center; display: block;"></asp:Label>
                    </div>
                </div>

                <!-- Maintenance Schedule -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-tools"></i> Maintenance Schedule</h3>
                        <asp:LinkButton ID="btnSchedule" runat="server" CssClass="btn btn-outline btn-sm" OnClick="btnSchedule_Click">
                            Schedule
                        </asp:LinkButton>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Unit</th>
                                    <th>Service</th>
                                    <th>Due Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptMaintenance" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("UnitName") %></td>
                                            <td><%# Eval("MaintenanceType") %></td>
                                            <td><%# Eval("DueDate", "{0:MMM dd}") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Temperature Status Legend -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-info-circle"></i> Temperature Status</h3>
                    </div>
                    <div style="display: flex; flex-direction: column; gap: 10px;">
                        <div class="temp-indicator">
                            <div class="temp-color temp-safe"></div>
                            <span>Within Range (±2°C)</span>
                        </div>
                        <div class="temp-indicator">
                            <div class="temp-color temp-warning"></div>
                            <span>Minor Deviation (±2-5°C)</span>
                        </div>
                        <div class="temp-indicator">
                            <div class="temp-color temp-danger"></div>
                            <span>Critical Deviation (>5°C)</span>
                        </div>
                    </div>
                </div>

                <!-- Compliance Summary -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-chart-pie"></i> Compliance Summary</h3>
                    </div>
                    <div style="text-align: center;">
                        <div class="compliance-gauge">
                            <div class="compliance-value" id="complianceValue" runat="server">0%</div>
                        </div>
                        <div style="margin-top: 10px; font-size: 14px; color: var(--gray-text);">
                            Overall Compliance Rate
                        </div>
                    </div>
                    <div style="margin-top: 20px;">
                        <div class="detail-item">
                            <span class="detail-label">Last 24h:</span>
                            <span class="detail-value" id="last24h" runat="server">0%</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Last 7 days:</span>
                            <span class="detail-value" id="last7days" runat="server">0%</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">This Month:</span>
                            <span class="detail-value" id="thisMonth" runat="server">0%</span>
                        </div>
                    </div>
                    
                    <div class="quick-actions">
                        <asp:LinkButton ID="btnComplianceReport" runat="server" CssClass="quick-action-btn" OnClick="btnComplianceReport_Click">
                            <i class="fas fa-file-alt"></i> Compliance Report
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSettings" runat="server" CssClass="quick-action-btn" OnClick="btnSettings_Click">
                            <i class="fas fa-cog"></i> Settings
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Add/Edit Unit -->
    <div class="modal fade" id="unitModal" tabindex="-1" aria-labelledby="unitModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="unitModalLabel">
                        <i class="fas fa-snowflake"></i> 
                        <span id="modalTitle">Add New Cold Chain Unit</span>
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Unit Name *</label>
                                <asp:TextBox ID="txtUnitName" runat="server" CssClass="form-control" 
                                    placeholder="Enter unit name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUnitName" runat="server" 
                                    ControlToValidate="txtUnitName" ErrorMessage="Unit name is required" 
                                    CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Unit Type *</label>
                                <asp:DropDownList ID="ddlUnitType" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="">Select Type</asp:ListItem>
                                    <asp:ListItem Value="Refrigerator">Refrigerator (2-8°C)</asp:ListItem>
                                    <asp:ListItem Value="Freezer">Freezer (-20°C)</asp:ListItem>
                                    <asp:ListItem Value="Ultra-Low">Ultra-Low Freezer (-80°C)</asp:ListItem>
                                    <asp:ListItem Value="Cold Room">Cold Room</asp:ListItem>
                                    <asp:ListItem Value="Transport">Transport Unit</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvUnitType" runat="server" 
                                    ControlToValidate="ddlUnitType" ErrorMessage="Unit type is required" 
                                    CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Target Temperature (°C) *</label>
                                <asp:TextBox ID="txtTargetTemp" runat="server" CssClass="form-control" 
                                    TextMode="Number" step="0.1" placeholder="e.g., -20.0"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTargetTemp" runat="server" 
                                    ControlToValidate="txtTargetTemp" ErrorMessage="Target temperature is required" 
                                    CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvTargetTemp" runat="server" 
                                    ControlToValidate="txtTargetTemp" Type="Double"
                                    MinimumValue="-100" MaximumValue="50" 
                                    ErrorMessage="Temperature must be between -100°C and 50°C"
                                    CssClass="text-danger" Display="Dynamic"></asp:RangeValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Location *</label>
                                <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" 
                                    placeholder="Enter location"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" 
                                    ControlToValidate="txtLocation" ErrorMessage="Location is required" 
                                    CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlUnitStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="Active">Active</asp:ListItem>
                                    <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                    <asp:ListItem Value="Maintenance">Maintenance</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Current Temperature (°C)</label>
                                <asp:TextBox ID="txtCurrentTemp" runat="server" CssClass="form-control" 
                                    TextMode="Number" step="0.1" placeholder="Current temperature"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                            TextMode="MultiLine" Rows="3" placeholder="Optional description"></asp:TextBox>
                    </div>
                    
                    <asp:HiddenField ID="hfUnitID" runat="server" Value="0" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSaveUnit" runat="server" CssClass="btn btn-primary" 
                        Text="Save Unit" OnClick="btnSaveUnit_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal for Delete -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger" id="deleteModalLabel">
                        <i class="fas fa-exclamation-triangle"></i> Confirm Delete
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this cold chain unit?</p>
                    <p class="text-danger"><strong>This action cannot be undone.</strong></p>
                    <asp:HiddenField ID="hfDeleteUnitID" runat="server" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnConfirmDelete" runat="server" CssClass="btn btn-danger" 
                        Text="Delete Unit" OnClick="btnConfirmDelete_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // دالة لعرض التنبيهات
        function showAlert(message, type) {
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
            alertDiv.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
            alertDiv.innerHTML = `
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            `;
            
            document.body.appendChild(alertDiv);
            
            setTimeout(() => {
                if (alertDiv.parentElement) {
                    alertDiv.remove();
                }
            }, 5000);
        }

        // Auto-refresh every 30 seconds
        function refreshData() {
            __doPostBack('<%= btnRefresh.UniqueID %>', '');
        }
        setInterval(refreshData, 30000);
    </script>
</asp:Content>