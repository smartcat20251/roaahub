﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientDashboard.aspx.cs" Inherits="roaahub.clientDashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --info-color: #2980b9;
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
        }

        .welcome-text {
            color: var(--gray-text);
            font-size: 16px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            background: var(--light-bg);
            padding: 12px 20px;
            border-radius: 10px;
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }

        .user-details {
            display: flex;
            flex-direction: column;
        }

        .user-name {
            font-weight: 600;
            color: var(--dark-text);
        }

        .user-role {
            font-size: 12px;
            color: var(--gray-text);
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
            color: var(--primary-color);
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
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .stat-number {
            font-size: 28px;
            font-weight: 800;
            color: var(--primary-color);
            margin-bottom: 8px;
        }

        .stat-label {
            font-size: 14px;
            color: var(--gray-text);
            font-weight: 500;
        }

        .info-section {
            margin-bottom: 25px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark-text);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--gray-text);
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e8ed;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
            background: var(--light-bg);
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
        }

        .form-control-editable {
            background: white !important;
            border-color: var(--primary-color) !important;
        }

        .subscription-card {
            background: linear-gradient(135deg, var(--primary-color), #2980b9);
            color: white;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .subscription-plan {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .subscription-price {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 15px;
        }

        .service-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .service-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px;
            background: var(--light-bg);
            border-radius: 10px;
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }

        .service-item:hover {
            background: #e8f4fd;
            transform: translateX(5px);
        }

        .service-info h4 {
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 5px;
            color: var(--dark-text);
        }

        .service-info div {
            font-size: 13px;
            color: var(--gray-text);
        }

        .service-status {
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #d5f4e6;
            color: var(--success-color);
        }

        .status-inactive {
            background: #fdeaea;
            color: var(--danger-color);
        }

        .status-trial {
            background: #fef5e7;
            color: var(--warning-color);
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
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
        }

        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }

        .btn-outline:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .btn-sm {
            padding: 8px 16px;
            font-size: 13px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
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

        .badge-success {
            background: #d5f4e6;
            color: var(--success-color);
        }

        .badge-warning {
            background: #fef5e7;
            color: var(--warning-color);
        }

        .badge-danger {
            background: #fdeaea;
            color: var(--danger-color);
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .progress-bar {
            height: 10px;
            background: #e1e5e9;
            border-radius: 5px;
            overflow: hidden;
            margin: 15px 0;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--primary-color), #2980b9);
            border-radius: 5px;
            transition: width 0.5s ease;
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
        }

        .quick-action-btn:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-2px);
            border-color: var(--primary-color);
            text-decoration: none;
        }

        .platform-services {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 20px;
        }

        .platform-service {
            background: linear-gradient(135deg, var(--light-bg), #e8f4fd);
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .platform-service:hover {
            border-color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.2);
        }

        .platform-icon {
            font-size: 24px;
            color: var(--primary-color);
            margin-bottom: 8px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        @media (max-width: 1200px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .form-grid {
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
            
            .quick-actions {
                grid-template-columns: 1fr;
            }
            
            .platform-services {
                grid-template-columns: 1fr;
            }
            
            .button-group {
                flex-direction: column;
                width: 100%;
            }
            
            .button-group .btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>

    <div class="dashboard-container">
        <!-- Header -->
        <div class="dashboard-header">
            <div class="header-left">
                <h1><i class="fas fa-tachometer-alt"></i> Client Dashboard</h1>
                <div class="welcome-text">Welcome back! Here's what's happening with your services today.</div>
            </div>
            <div class="header-right">
                <div class="user-info">
                    <div class="user-avatar" id="userAvatar" runat="server">U</div>
                    <div class="user-details">
                        <div class="user-name" id="userName" runat="server">Loading...</div>
                        <div class="user-role">Client Account</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <!-- Left Column -->
            <div class="main-content">
                <!-- Profile Overview -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-chart-line"></i> Business Overview</h3>
                        <button class="btn btn-outline btn-sm" onclick="refreshData()">
                            <i class="fas fa-sync-alt"></i> Refresh
                        </button>
                    </div>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-number" id="activeVehicles" runat="server">0</div>
                            <div class="stat-label">Active Vehicles</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="coldChainUnits" runat="server">0</div>
                            <div class="stat-label">Cold Chain Units</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="assetsTracked" runat="server">0</div>
                            <div class="stat-label">Assets Tracked</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="memberSince" runat="server">0</div>
                            <div class="stat-label">Member Since</div>
                        </div>
                    </div>
                </div>

                <!-- Personal Information -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-user"></i> Personal Information</h3>
                        <div class="button-group">
                            <button type="button" id="btnEditPersonal" class="btn btn-outline btn-sm" onclick="togglePersonalEdit()">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <asp:Button ID="btnSavePersonal" runat="server" CssClass="btn btn-primary btn-sm" 
                                Text="Save" OnClick="UpdateUserProfile" Style="display: none;" OnClientClick="return validatePersonalForm();" />
                            <button type="button" id="btnCancelPersonal" class="btn btn-outline btn-sm" 
                                onclick="cancelPersonalEdit()" style="display: none;">
                                <i class="fas fa-times"></i> Cancel
                            </button>
                        </div>
                    </div>
                    <div class="form-grid">
                        <div class="form-group">
                            <label><i class="fas fa-user"></i> First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <small class="validation-message" id="valFirstName" style="color: red; display: none;">First name is required</small>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-user"></i> Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <small class="validation-message" id="valLastName" style="color: red; display: none;">Last name is required</small>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-envelope"></i> Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ReadOnly="true" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-phone"></i> Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <small class="validation-message" id="valPhone" style="color: red; display: none;">Phone number is required</small>
                        </div>
                    </div>
                </div>

                <!-- Company Information -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-building"></i> Company Information</h3>
                        <div class="button-group">
                            <button type="button" id="btnEditCompany" class="btn btn-outline btn-sm" onclick="toggleCompanyEdit()">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                            <asp:Button ID="btnSaveCompany" runat="server" CssClass="btn btn-primary btn-sm" 
                                Text="Save" OnClick="UpdateCompanyInfo" Style="display: none;" OnClientClick="return validateCompanyForm();" />
                            <button type="button" id="btnCancelCompany" class="btn btn-outline btn-sm" 
                                onclick="cancelCompanyEdit()" style="display: none;">
                                <i class="fas fa-times"></i> Cancel
                            </button>
                        </div>
                    </div>
                    <div class="form-grid">
                        <div class="form-group">
                            <label><i class="fas fa-building"></i> Company Name</label>
                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <small class="validation-message" id="valCompanyName" style="color: red; display: none;">Company name is required</small>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-id-card"></i> Commercial Registration</label>
                            <asp:TextBox ID="txtCommercialReg" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-receipt"></i> Tax ID</label>
                            <asp:TextBox ID="txtTaxID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label><i class="fas fa-industry"></i> Industry Type</label>
                            <asp:TextBox ID="txtIndustry" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Sidebar -->
            <div class="sidebar">
                <!-- Subscription Overview -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-crown"></i> Subscription Plan</h3>
                    </div>
                    <div class="subscription-card">
                        <div class="subscription-plan">Premium Plan</div>
                        <div class="subscription-price">$2,499<small>/month</small></div>
                        <div>All services included with premium support</div>
                        <div class="service-status status-active" style="margin-top: 10px;">Active</div>
                    </div>
                    
                    <div class="section-title"><i class="fas fa-chart-pie"></i> Usage Analytics</div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: 78%;"></div>
                    </div>
                    <div style="text-align: center; font-size: 14px; color: var(--gray-text);">78% of monthly quota used</div>
                    
                    <div class="quick-actions">
                        <a href="billing.aspx" class="quick-action-btn">
                            <i class="fas fa-file-invoice-dollar"></i> Billing
                        </a>
                        <a href="upgrade.aspx" class="quick-action-btn">
                            <i class="fas fa-rocket"></i> Upgrade
                        </a>
                    </div>
                </div>

                <!-- Services & Subscriptions -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-sliders-h"></i> Active Services</h3>
                        <a href="services.aspx" class="btn btn-outline btn-sm">
                            <i class="fas fa-cog"></i> Manage
                        </a>
                    </div>
                    <div class="service-list">
                        <div class="service-item">
                            <div class="service-info">
                                <h4>ROAA Fleet</h4>
                                <div>Vehicle tracking & management</div>
                            </div>
                            <div class="service-status status-active">Active</div>
                        </div>
                        <div class="service-item">
                            <div class="service-info">
                                <h4>ROAA Cold Chain</h4>
                                <div>Temperature monitoring</div>
                            </div>
                            <div class="service-status status-active">Active</div>
                        </div>
                        <div class="service-item">
                            <div class="service-info">
                                <h4>ROAA Dozr</h4>
                                <div>Asset tracking</div>
                            </div>
                            <div class="service-status status-active">Active</div>
                        </div>
                        <div class="service-item">
                            <div class="service-info">
                                <h4>ROAA Palm</h4>
                                <div>Palm tree monitoring</div>
                            </div>
                            <div class="service-status status-trial">Trial</div>
                        </div>
                    </div>
                    
                    <div class="platform-services">
                        <div class="platform-service" onclick="location.href='fleet.aspx'">
                            <div class="platform-icon">🚗</div>
                            <div>Fleet</div>
                        </div>
                        <div class="platform-service" onclick="location.href='coldchain.aspx'">
                            <div class="platform-icon">❄️</div>
                            <div>Cold Chain</div>
                        </div>
                        <div class="platform-service" onclick="location.href='dozr.aspx'">
                            <div class="platform-icon">🏗️</div>
                            <div>Dozr</div>
                        </div>
                        <div class="platform-service" onclick="location.href='palm.aspx'">
                            <div class="platform-icon">🌴</div>
                            <div>Palm</div>
                        </div>
                    </div>
                </div>

                <!-- Recent Support Tickets -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title"><i class="fas fa-headset"></i> Support History</h3>
                        <a href="support.aspx" class="btn btn-outline btn-sm">
                            <i class="fas fa-plus"></i> New Ticket
                        </a>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Ticket</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#TICKET-2025-001</td>
                                <td><span class="badge badge-success">Resolved</span></td>
                                <td>Feb 20, 2025</td>
                            </tr>
                            <tr>
                                <td>#TICKET-2025-002</td>
                                <td><span class="badge badge-warning">In Progress</span></td>
                                <td>Feb 18, 2025</td>
                            </tr>
                            <tr>
                                <td>#TICKET-2025-003</td>
                                <td><span class="badge badge-danger">Open</span></td>
                                <td>Feb 15, 2025</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        let originalPersonalData = {};
        let originalCompanyData = {};

        function refreshData() {
            location.reload();
        }

        function togglePersonalEdit() {
            const inputs = ['txtFirstName', 'txtLastName', 'txtPhone'];
            const editBtn = document.getElementById('btnEditPersonal');
            const saveBtn = document.getElementById('<%= btnSavePersonal.ClientID %>');
            const cancelBtn = document.getElementById('btnCancelPersonal');

            // حفظ البيانات الأصلية
            inputs.forEach(id => {
                const input = document.getElementById('<%= ' + id + '.ClientID %>');
                originalPersonalData[id] = input.value;
                input.readOnly = false;
                input.classList.add('form-control-editable');

                // إخفاء رسائل الخطأ
                const valMsg = document.getElementById('val' + id.replace('txt', ''));
                if (valMsg) valMsg.style.display = 'none';
            });

            // إظهار وإخفاء الأزرار
            editBtn.style.display = 'none';
            saveBtn.style.display = 'inline-block';
            cancelBtn.style.display = 'inline-block';
        }

        function cancelPersonalEdit() {
            const inputs = ['txtFirstName', 'txtLastName', 'txtPhone'];
            const editBtn = document.getElementById('btnEditPersonal');
            const saveBtn = document.getElementById('<%= btnSavePersonal.ClientID %>');
            const cancelBtn = document.getElementById('btnCancelPersonal');

            // استعادة البيانات الأصلية
            inputs.forEach(id => {
                const input = document.getElementById('<%= ' + id + '.ClientID %>');
                input.value = originalPersonalData[id];
                input.readOnly = true;
                input.classList.remove('form-control-editable');

                // إخفاء رسائل الخطأ
                const valMsg = document.getElementById('val' + id.replace('txt', ''));
                if (valMsg) valMsg.style.display = 'none';
            });

            // إظهار وإخفاء الأزرار
            editBtn.style.display = 'inline-block';
            saveBtn.style.display = 'none';
            cancelBtn.style.display = 'none';
        }

        function toggleCompanyEdit() {
            const inputs = ['txtCompanyName', 'txtCommercialReg', 'txtTaxID', 'txtIndustry'];
            const editBtn = document.getElementById('btnEditCompany');
            const saveBtn = document.getElementById('<%= btnSaveCompany.ClientID %>');
            const cancelBtn = document.getElementById('btnCancelCompany');

            // حفظ البيانات الأصلية
            inputs.forEach(id => {
                const input = document.getElementById('<%= ' + id + '.ClientID %>');
                originalCompanyData[id] = input.value;
                input.readOnly = false;
                input.classList.add('form-control-editable');

                // إخفاء رسائل الخطأ
                const valMsg = document.getElementById('val' + id.replace('txt', ''));
                if (valMsg) valMsg.style.display = 'none';
            });

            // إظهار وإخفاء الأزرار
            editBtn.style.display = 'none';
            saveBtn.style.display = 'inline-block';
            cancelBtn.style.display = 'inline-block';
        }

        function cancelCompanyEdit() {
            const inputs = ['txtCompanyName', 'txtCommercialReg', 'txtTaxID', 'txtIndustry'];
            const editBtn = document.getElementById('btnEditCompany');
            const saveBtn = document.getElementById('<%= btnSaveCompany.ClientID %>');
            const cancelBtn = document.getElementById('btnCancelCompany');

            // استعادة البيانات الأصلية
            inputs.forEach(id => {
                const input = document.getElementById('<%= ' + id + '.ClientID %>');
                input.value = originalCompanyData[id];
                input.readOnly = true;
                input.classList.remove('form-control-editable');

                // إخفاء رسائل الخطأ
                const valMsg = document.getElementById('val' + id.replace('txt', ''));
                if (valMsg) valMsg.style.display = 'none';
            });

            // إظهار وإخفاء الأزرار
            editBtn.style.display = 'inline-block';
            saveBtn.style.display = 'none';
            cancelBtn.style.display = 'none';
        }

        function validatePersonalForm() {
            let isValid = true;

            const firstName = document.getElementById('<%= txtFirstName.ClientID %>');
            const lastName = document.getElementById('<%= txtLastName.ClientID %>');
            const phone = document.getElementById('<%= txtPhone.ClientID %>');

            // إعادة تعيين رسائل الخطأ
            document.getElementById('valFirstName').style.display = 'none';
            document.getElementById('valLastName').style.display = 'none';
            document.getElementById('valPhone').style.display = 'none';

            // التحقق من الحقول المطلوبة
            if (!firstName.value.trim()) {
                document.getElementById('valFirstName').style.display = 'block';
                isValid = false;
            }

            if (!lastName.value.trim()) {
                document.getElementById('valLastName').style.display = 'block';
                isValid = false;
            }

            if (!phone.value.trim()) {
                document.getElementById('valPhone').style.display = 'block';
                isValid = false;
            }

            return isValid;
        }

        function validateCompanyForm() {
            let isValid = true;

            const companyName = document.getElementById('<%= txtCompanyName.ClientID %>');

            // إعادة تعيين رسائل الخطأ
            document.getElementById('valCompanyName').style.display = 'none';

            // التحقق من الحقول المطلوبة
            if (!companyName.value.trim()) {
                document.getElementById('valCompanyName').style.display = 'block';
                isValid = false;
            }

            return isValid;
        }

        // Auto-refresh every 30 seconds
        setTimeout(refreshData, 30000);
    </script>
</asp:Content>