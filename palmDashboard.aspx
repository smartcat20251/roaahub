<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="palmDashboard.aspx.cs" Inherits="roaahub.palmDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        :root {
            --primary-color: #4caf50;
            --secondary-color: #8bc34a;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
            --harvest-color: #ff9800;
            --farm-color: #795548;
            --light-bg: #f8f9fa;
            --dark-text: #333;
            --gray-text: #666;
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

        .farms-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
        }

        .farm-card {
            border: 1px solid #e1e5e9;
            border-radius: 8px;
            padding: 15px;
            background: white;
            position: relative;
        }

        .farm-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .farm-info h4 {
            font-size: 16px;
            font-weight: 600;
            color: var(--dark-text);
        }

        .farm-status {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-active { background: #e7f7ef; color: var(--success-color); }
        .status-inactive { background: #fef0f0; color: var(--danger-color); }

        .tree-gauge {
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

        .tree-gauge::before {
            content: '';
            width: 60px;
            height: 60px;
            background: white;
            border-radius: 50%;
            position: absolute;
        }

        .tree-value {
            position: relative;
            z-index: 1;
            font-weight: 700;
            font-size: 16px;
        }

        .farm-details {
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
        .badge-primary { background: #e8f5e8; color: var(--primary-color); }

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
            background: var(--primary-color);
            border-radius: 4px;
        }

        .yield-card {
            background: linear-gradient(135deg, var(--harvest-color), #ffb74d);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .yield-amount {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .yield-label {
            font-size: 14px;
            opacity: 0.9;
        }

        .tree-type-tag {
            display: inline-block;
            padding: 4px 8px;
            background: var(--light-bg);
            border-radius: 12px;
            font-size: 11px;
            color: var(--gray-text);
            margin-right: 5px;
        }

        .sensor-data {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 10px;
        }

        .sensor-item {
            text-align: center;
            padding: 8px;
            background: #f8f9fa;
            border-radius: 6px;
        }

        .sensor-value {
            font-weight: 700;
            font-size: 16px;
            color: var(--primary-color);
        }

        .sensor-label {
            font-size: 12px;
            color: var(--gray-text);
        }

        .form-control {
            padding: 8px 12px;
            border: 1px solid #e1e5e9;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container">
        <!-- Header -->
        <div class="dashboard-header">
            <div class="header-left">
                <h1>Palm Management Dashboard</h1>
            </div>
            <div class="header-actions">
                <button type="button" class="btn btn-outline">
                    <i>📊</i> Yield Reports
                </button>
                <button type="button" class="btn btn-primary">
                    <i>➕</i> Add Farm
                </button>
            </div>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <!-- Left Column -->
            <div class="main-content">
                <!-- Palm Farm Overview -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Palm Farm Overview</h3>
                        <div class="filters">
                            <select class="form-control" style="width: 150px;">
                                <option>All Farms</option>
                                <option>Active Only</option>
                                <option>By Region</option>
                            </select>
                        </div>
                    </div>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-number" id="totalFarms" runat="server">3</div>
                            <div class="stat-label">Total Farms</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="totalTrees" runat="server">3,000</div>
                            <div class="stat-label">Palm Trees</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="healthyTrees" runat="server">95%</div>
                            <div class="stat-label">Healthy Trees</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="avgYield" runat="server">125.5</div>
                            <div class="stat-label">Avg Yield (kg)</div>
                        </div>
                    </div>
                </div>

                <!-- Farm Management -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Farm Management</h3>
                        <button type="button" class="btn btn-outline btn-sm">Refresh</button>
                    </div>
                    <div class="map-container">
                        🗺️ Farm Location Map
                    </div>
                    <div class="farms-grid" style="margin-top: 15px;">
                        <asp:Repeater ID="rptFarms" runat="server">
                            <ItemTemplate>
                                <div class="farm-card">
                                    <div class="farm-header">
                                        <div class="farm-info">
                                            <h4><%# Eval("FarmName") %></h4>
                                            <div style="font-size: 12px; color: var(--gray-text);">
                                                <span class="tree-type-tag"><%# Eval("FarmCode") %></span>
                                                <%# Eval("Location") %>
                                            </div>
                                        </div>
                                        <div class='farm-status status-<%# Eval("Status").ToString().ToLower() %>'>
                                            <%# Eval("Status") %>
                                        </div>
                                    </div>
                                    <div class="tree-gauge">
                                        <div class="tree-value"><%# Eval("TotalTrees") %></div>
                                    </div>
                                    <div class="farm-details">
                                        <div class="detail-item">
                                            <span class="detail-label">Area:</span>
                                            <span class="detail-value"><%# Eval("TotalArea") %> ha</span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Cultivated:</span>
                                            <span class="detail-value"><%# Eval("CultivatedArea") %> ha</span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Soil Type:</span>
                                            <span class="detail-value"><%# Eval("SoilType") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Irrigation:</span>
                                            <span class="detail-value"><%# Eval("IrrigationType") %></span>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Recent Harvests -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Recent Harvests</h3>
                        <button type="button" class="btn btn-outline btn-sm">View All</button>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tree</th>
                                <th>Farm</th>
                                <th>Harvest Date</th>
                                <th>Yield</th>
                                <th>Quality</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptHarvests" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("TreeNumber") %></td>
                                        <td><%# Eval("FarmName") %></td>
                                        <td><%# FormatDate(Eval("HarvestDate")) %></td>
                                        <td><%# Eval("YieldAmount") %> kg</td>
                                        <td><span class='badge badge-<%# GetQualityBadge(Eval("QualityGrade") != null ? Eval("QualityGrade").ToString() : "") %>'><%# Eval("QualityGrade") %></span></td>
                                        <td><span class='badge badge-<%# GetStatusBadge(Eval("Status") != null ? Eval("Status").ToString() : "") %>'><%# Eval("Status") %></span></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Right Sidebar -->
            <div class="sidebar">
                <!-- Yield Summary -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Yield Summary</h3>
                    </div>
                    <div class="yield-card">
                        <div class="yield-amount">12,850 kg</div>
                        <div class="yield-label">Total Annual Production</div>
                    </div>
                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px;">
                        <div class="stat-card">
                            <div class="stat-number">+8.5%</div>
                            <div class="stat-label">Growth Rate</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number">92%</div>
                            <div class="stat-label">Premium Grade</div>
                        </div>
                    </div>
                </div>

                <!-- Health Alerts -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Health Alerts</h3>
                        <span class="badge badge-danger" id="alertCount" runat="server">2</span>
                    </div>
                    <div class="alerts-list">
                        <asp:Repeater ID="rptAlerts" runat="server">
                            <ItemTemplate>
                                <div class='alert-item <%# Eval("Severity") != null ? Eval("Severity").ToString().ToLower() : "" %>'>
                                    <div class="alert-header">
                                        <div class="alert-type"><%# Eval("IssueType") %></div>
                                        <div class="alert-severity"><%# Eval("Severity") %></div>
                                    </div>
                                    <div class="alert-message"><%# Eval("IssueDescription") %></div>
                                    <div style="font-size: 11px; margin-top: 5px; color: var(--gray-text);">
                                        Tree: <%# Eval("TreeNumber") %> | <%# FormatDate(Eval("MonitoringDate")) %>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Irrigation Schedule -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Irrigation Schedule</h3>
                        <button type="button" class="btn btn-outline btn-sm">Schedule</button>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Farm</th>
                                <th>Last Watered</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptIrrigation" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("FarmName") %></td>
                                        <td><%# FormatShortDate(Eval("IrrigationDate")) %></td>
                                        <td><%# Eval("WaterAmount") %> L</td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

                <!-- Sensor Data -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Live Sensor Data</h3>
                    </div>
                    <div class="sensor-data">
                        <div class="sensor-item">
                            <div class="sensor-value">62.5%</div>
                            <div class="sensor-label">Soil Moisture</div>
                        </div>
                        <div class="sensor-item">
                            <div class="sensor-value">32.8°C</div>
                            <div class="sensor-label">Temperature</div>
                        </div>
                        <div class="sensor-item">
                            <div class="sensor-value">45.2%</div>
                            <div class="sensor-label">Humidity</div>
                        </div>
                        <div class="sensor-item">
                            <div class="sensor-value">85k lux</div>
                            <div class="sensor-label">Light</div>
                        </div>
                    </div>
                    <div style="margin-top: 15px;">
                        <div class="detail-item">
                            <span class="detail-label">Last Update:</span>
                            <span class="detail-value">2 mins ago</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label">Farm:</span>
                            <span class="detail-value">Al-Rashid Oasis</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>