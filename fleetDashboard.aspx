<%@ Page Title="Fleet Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="fleetDashboard.aspx.cs" Inherits="roaahub.fleetDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8" />
    <title>Fleet Dashboard - RoaaHub</title>
    <style>
        :root {
            --primary-color: #667eea;
            --secondary-color: #764ba2;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
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

        .btn-success {
            background: var(--success-color);
            color: white;
        }

        .btn-danger {
            background: var(--danger-color);
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

        .vehicles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 15px;
        }

        .vehicle-card {
            border: 1px solid #e1e5e9;
            border-radius: 8px;
            padding: 15px;
            background: white;
            position: relative;
        }

        .vehicle-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .vehicle-info h4 {
            font-size: 16px;
            font-weight: 600;
            color: var(--dark-text);
        }

        .vehicle-actions {
            display: flex;
            gap: 5px;
        }

        .btn-sm {
            padding: 4px 8px;
            font-size: 12px;
        }

        .vehicle-status {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-active { background: #e7f7ef; color: var(--success-color); }
        .status-inactive { background: #fef0f0; color: var(--danger-color); }
        .status-maintenance { background: #fff8e6; color: var(--warning-color); }

        .vehicle-details {
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
            position: relative;
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

        .map-container {
            height: 300px;
            background: #e9ecef;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gray-text);
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 20px;
            border-radius: 8px;
            width: 500px;
            max-width: 90%;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
        }

        .close {
            font-size: 24px;
            cursor: pointer;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .action-buttons {
            display: flex;
            gap: 5px;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Header -->
        <div class="dashboard-header">
            <div class="header-left">
                <h1>Fleet Management Dashboard</h1>
            </div>
            <div class="header-actions">
                <button class="btn btn-outline" onclick="openReportsModal()">
                    📊 Reports
                </button>
                <button class="btn btn-primary" onclick="openAddVehicleModal()">
                    ➕ Add Vehicle
                </button>
            </div>
        </div>

        <!-- Main Content -->
        <div class="dashboard-content">
            <!-- Left Column -->
            <div class="main-content">
                <!-- Fleet Overview -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Fleet Overview</h3>
                        <div class="filters">
                            <select class="form-control" style="width: 150px;" onchange="filterVehicles(this.value)">
                                <option value="all">All Vehicles</option>
                                <option value="active">Active Only</option>
                                <option value="maintenance">In Maintenance</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-number" id="totalVehicles" runat="server">24</div>
                            <div class="stat-label">Total Vehicles</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="activeVehicles" runat="server">18</div>
                            <div class="stat-label">Active</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="maintenanceVehicles" runat="server">3</div>
                            <div class="stat-label">In Maintenance</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-number" id="idleVehicles" runat="server">3</div>
                            <div class="stat-label">Idle</div>
                        </div>
                    </div>
                </div>

                <!-- Live Vehicle Tracking -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Live Vehicle Tracking</h3>
                        <button class="btn btn-outline btn-sm" onclick="refreshData()">Refresh</button>
                    </div>
                    <div class="map-container">
                        🗺️ Interactive Map View
                    </div>
                    <div class="vehicles-grid" style="margin-top: 15px;">
                        <asp:Repeater ID="rptVehicles" runat="server" OnItemCommand="rptVehicles_ItemCommand">
                            <ItemTemplate>
                                <div class="vehicle-card">
                                    <div class="vehicle-header">
                                        <div class="vehicle-info">
                                            <h4><%# Eval("VehicleNumber") %></h4>
                                            <div style="font-size: 12px; color: var(--gray-text);"><%# Eval("LicensePlate") %></div>
                                        </div>
                                        <div class="vehicle-actions">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("VehicleID") %>' CssClass="btn btn-outline btn-sm">✏️</asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("VehicleID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this vehicle?');">🗑️</asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class='vehicle-status status-<%# Eval("Status").ToString().ToLower() %>'>
                                        <%# Eval("Status") %>
                                    </div>
                                    <div class="vehicle-details">
                                        <div class="detail-item">
                                            <span class="detail-label">Type:</span>
                                            <span class="detail-value"><%# Eval("VehicleType") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Location:</span>
                                            <span class="detail-value"><%# Eval("CurrentLocation") %></span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Speed:</span>
                                            <span class="detail-value"><%# Eval("Speed") %> km/h</span>
                                        </div>
                                        <div class="detail-item">
                                            <span class="detail-label">Fuel:</span>
                                            <span class="detail-value"><%# Eval("FuelLevel") %>%</span>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Recent Trips -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Recent Trips</h3>
                        <button class="btn btn-outline btn-sm" onclick="openAddTripModal()">Add Trip</button>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Vehicle</th>
                                <th>Route</th>
                                <th>Distance</th>
                                <th>Fuel Used</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptTrips" runat="server" OnItemCommand="rptTrips_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("VehicleNumber") %></td>
                                        <td><%# Eval("StartLocation") %> → <%# Eval("EndLocation") %></td>
                                        <td><%# Eval("Distance") %> km</td>
                                        <td><%# Eval("FuelConsumed") %> L</td>
                                        <td><span class='badge badge-<%# GetStatusBadge(Eval("Status").ToString()) %>'><%# Eval("Status") %></span></td>
                                        <td>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnEditTrip" runat="server" CommandName="Edit" CommandArgument='<%# Eval("TripID") %>' CssClass="btn btn-outline btn-sm">Edit</asp:LinkButton>
                                                <asp:LinkButton ID="btnDeleteTrip" runat="server" CommandName="Delete" CommandArgument='<%# Eval("TripID") %>' CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure you want to delete this trip?');">Delete</asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Right Sidebar -->
            <div class="sidebar">
                <!-- Active Alerts -->
                <div class="widget">
                    <div class="widget-header">
                        <h3 class="widget-title">Active Alerts</h3>
                        <span class="badge badge-danger" id="alertCount" runat="server">3</span>
                    </div>
                    <div class="alerts-list">
                        <asp:Repeater ID="rptAlerts" runat="server" OnItemCommand="rptAlerts_ItemCommand">
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
                                    <div class="action-buttons" style="margin-top: 8px;">
                                        <asp:LinkButton ID="btnResolveAlert" runat="server" CommandName="Resolve" CommandArgument='<%# Eval("AlertID") %>' CssClass="btn btn-success btn-sm">Resolve</asp:LinkButton>
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
                        <button class="btn btn-outline btn-sm" onclick="openAddMaintenanceModal()">Schedule</button>
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Vehicle</th>
                                <th>Service</th>
                                <th>Due Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptMaintenance" runat="server" OnItemCommand="rptMaintenance_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("VehicleNumber") %></td>
                                        <td><%# Eval("MaintenanceType") %></td>
                                        <td><%# Eval("NextServiceDate", "{0:MMM dd, yyyy}") %></td>
                                        <td>
                                            <div class="action-buttons">
                                                <asp:LinkButton ID="btnCompleteMaintenance" runat="server" CommandName="Complete" CommandArgument='<%# Eval("MaintenanceID") %>' CssClass="btn btn-success btn-sm">Complete</asp:LinkButton>
                                                <asp:LinkButton ID="btnCancelMaintenance" runat="server" CommandName="Cancel" CommandArgument='<%# Eval("MaintenanceID") %>' CssClass="btn btn-danger btn-sm">Cancel</asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Vehicle Modal -->
    <div id="addVehicleModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add New Vehicle</h3>
                <span class="close" onclick="closeAddVehicleModal()">&times;</span>
            </div>
            <form id="addVehicleForm">
                <div class="form-group">
                    <label class="form-label">Vehicle Number</label>
                    <input type="text" id="txtVehicleNumber" class="form-control" required />
                </div>
                <div class="form-group">
                    <label class="form-label">License Plate</label>
                    <input type="text" id="txtLicensePlate" class="form-control" required />
                </div>
                <div class="form-group">
                    <label class="form-label">Vehicle Type</label>
                    <select id="ddlVehicleType" class="form-control" required>
                        <option value="">Select Type</option>
                        <option value="Truck">Truck</option>
                        <option value="Van">Van</option>
                        <option value="Refrigerated Truck">Refrigerated Truck</option>
                        <option value="Pickup Truck">Pickup Truck</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Model</label>
                    <input type="text" id="txtModel" class="form-control" />
                </div>
                <div class="form-group">
                    <label class="form-label">Year</label>
                    <input type="number" id="txtYear" class="form-control" min="2000" max="2030" />
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <select id="ddlStatus" class="form-control" required>
                        <option value="Active">Active</option>
                        <option value="Maintenance">Maintenance</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>
                <div class="form-actions">
                    <button type="button" class="btn btn-outline" onclick="closeAddVehicleModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="saveVehicle()">Save Vehicle</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Add Trip Modal -->
    <div id="addTripModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Add New Trip</h3>
                <span class="close" onclick="closeAddTripModal()">&times;</span>
            </div>
            <form id="addTripForm">
                <div class="form-group">
                    <label class="form-label">Vehicle</label>
                    <select id="ddlTripVehicle" class="form-control" required>
                        <option value="">Select Vehicle</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Start Location</label>
                    <input type="text" id="txtStartLocation" class="form-control" required />
                </div>
                <div class="form-group">
                    <label class="form-label">End Location</label>
                    <input type="text" id="txtEndLocation" class="form-control" required />
                </div>
                <div class="form-group">
                    <label class="form-label">Distance (km)</label>
                    <input type="number" id="txtDistance" class="form-control" step="0.1" required />
                </div>
                <div class="form-group">
                    <label class="form-label">Fuel Consumed (L)</label>
                    <input type="number" id="txtFuelConsumed" class="form-control" step="0.1" required />
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <select id="ddlTripStatus" class="form-control" required>
                        <option value="Active">Active</option>
                        <option value="Completed">Completed</option>
                        <option value="Cancelled">Cancelled</option>
                    </select>
                </div>
                <div class="form-actions">
                    <button type="button" class="btn btn-outline" onclick="closeAddTripModal()">Cancel</button>
                    <button type="button" class="btn btn-primary" onclick="saveTrip()">Save Trip</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Modal Functions
        function openAddVehicleModal() {
            document.getElementById('addVehicleModal').style.display = 'block';
        }

        function closeAddVehicleModal() {
            document.getElementById('addVehicleModal').style.display = 'none';
            document.getElementById('addVehicleForm').reset();
        }

        function openAddTripModal() {
            document.getElementById('addTripModal').style.display = 'block';
        }

        function closeAddTripModal() {
            document.getElementById('addTripModal').style.display = 'none';
            document.getElementById('addTripForm').reset();
        }

        function openAddMaintenanceModal() {
            alert('Maintenance modal would open here');
        }

        function openReportsModal() {
            alert('Reports modal would open here');
        }

        // Filter Functions
        function filterVehicles(status) {
            alert('Filtering vehicles by: ' + status);
            // Implementation would filter the vehicle list
        }

        function refreshData() {
            location.reload();
        }

        // Close modals when clicking outside
        window.onclick = function (event) {
            const modals = document.getElementsByClassName('modal');
            for (let modal of modals) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            }
        }

        // Save Functions (would typically call server-side methods)
        function saveVehicle() {
            alert('Vehicle saved! (This would call server-side method)');
            closeAddVehicleModal();
        }

        function saveTrip() {
            alert('Trip saved! (This would call server-side method)');
            closeAddTripModal();
        }
        // Save Functions that call server-side methods
        function saveVehicle() {
            const vehicleNumber = document.getElementById('txtVehicleNumber').value;
            const licensePlate = document.getElementById('txtLicensePlate').value;
            const vehicleType = document.getElementById('ddlVehicleType').value;
            const model = document.getElementById('txtModel').value;
            const year = document.getElementById('txtYear').value;
            const status = document.getElementById('ddlStatus').value;

            // Call server-side method using PageMethods
            PageMethods.AddVehicle(vehicleNumber, licensePlate, vehicleType, model, year, status, onSaveVehicleSuccess, onSaveVehicleError);
        }

        function saveTrip() {
            const vehicleId = document.getElementById('ddlTripVehicle').value;
            const startLocation = document.getElementById('txtStartLocation').value;
            const endLocation = document.getElementById('txtEndLocation').value;
            const distance = document.getElementById('txtDistance').value;
            const fuelConsumed = document.getElementById('txtFuelConsumed').value;
            const status = document.getElementById('ddlTripStatus').value;

            PageMethods.AddTrip(vehicleId, startLocation, endLocation, distance, fuelConsumed, status, onSaveTripSuccess, onSaveTripError);
        }

        function onSaveVehicleSuccess(result) {
            if (result === 'success') {
                alert('Vehicle saved successfully!');
                closeAddVehicleModal();
                location.reload(); // Refresh the page to show new data
            } else {
                alert('Error saving vehicle: ' + result);
            }
        }

        function onSaveVehicleError(error) {
            alert('Error saving vehicle: ' + error.get_message());
        }

        function onSaveTripSuccess(result) {
            if (result === 'success') {
                alert('Trip saved successfully!');
                closeAddTripModal();
                location.reload(); // Refresh the page to show new data
            } else {
                alert('Error saving trip: ' + result);
            }
        }

        function onSaveTripError(error) {
            alert('Error saving trip: ' + error.get_message());
        }
    </script>
</body>
</html>
</asp:Content>