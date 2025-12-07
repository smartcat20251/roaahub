<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="roaahub.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Welcome to Roaahub</h1>
            <p class="lead">Access your dashboard and manage your IoT solutions</p>
        </div>
    </section>

    <!-- Login & Registration Tabs -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <!-- Tabs Navigation -->
                    <ul class="nav nav-tabs nav-justified mb-4" id="authTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">
                                <i class="fas fa-sign-in-alt"></i> Login
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">
                                <i class="fas fa-user-plus"></i> Register
                            </button>
                        </li>
                    </ul>

                    <!-- Tabs Content -->
                    <div class="tab-content" id="authTabsContent">
                        
                        <!-- Login Tab -->
                        <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                            <div class="roaahub-feature-box">
                                <h3 class="text-center">Sign In to Your Account</h3>
                                
                                <!-- Success/Error Messages -->
                                <div id="alertContainerLogin">
                                    <asp:Label ID="lblMsgLogin" runat="server" Text="" CssClass="alert-message"></asp:Label>
                                </div>

                                <div class="form-horizontal mt-4">
                                    <div class="form-group">
                                        <label class="control-label">Email Address *</label>
                                        <asp:TextBox ID="txtEmailLogin" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmailLogin" runat="server" ControlToValidate="txtEmailLogin" 
                                            ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Password *</label>
                                        <asp:TextBox ID="txtPasswordLogin" runat="server" CssClass="form-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPasswordLogin" runat="server" ControlToValidate="txtPasswordLogin" 
                                            ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group form-check d-flex justify-content-between align-items-center">
                                        <div>
                                            <asp:CheckBox ID="cbRememberMe" runat="server" CssClass="form-check-input" />
                                            <label class="form-check-label" for="<%= cbRememberMe.ClientID %>">Remember me</label>
                                        </div>
                                        <div>
                                            <a href="forgotPassword.aspx" class="text-muted">Forgot password?</a>
                                        </div>
                                    </div>

                                    <div class="form-group text-center">
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                            CssClass="roaahub-btn-primary btn-lg btn-block" OnClick="btnLogin_Click" />
                                    </div>

                                    <!-- Demo Accounts -->
                                    <div class="mt-4 p-3" style="background-color: #f8f9fa; border-radius: 8px;">
                                        <h6 class="text-center mb-3">Demo Accounts:</h6>
                                        <div class="row text-center">
                                            <div class="col-md-3">
                                                <small><strong>Client</strong><br>client@company.com<br>client123</small>
                                            </div>
                                            <div class="col-md-3">
                                                <small><strong>Supervisor</strong><br>supervisor@company.com<br>super123</small>
                                            </div>
                                            <div class="col-md-3">
                                                <small><strong>Worker</strong><br>worker@company.com<br>worker123</small>
                                            </div>
                                            <div class="col-md-3">
                                                <small><strong>Developer</strong><br>developer@roaahub.com<br>dev123</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Register Tab -->
                        <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                            <div class="roaahub-feature-box">
                                <h3 class="text-center">Create New Account</h3>
                                
                                <!-- Success/Error Messages -->
                                <div id="alertContainerRegister">
                                    <asp:Label ID="lblMsgRegister" runat="server" Text="" CssClass="alert-message"></asp:Label>
                                </div>

                                <div class="form-horizontal mt-4">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">First Name *</label>
                                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" 
                                                    ErrorMessage="First name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Last Name *</label>
                                                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" 
                                                    ErrorMessage="Last name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Email Address *</label>
                                        <asp:TextBox ID="txtEmailRegister" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmailRegister" runat="server" ControlToValidate="txtEmailRegister" 
                                            ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revEmailRegister" runat="server" ControlToValidate="txtEmailRegister"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ErrorMessage="Invalid email format" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Company Name *</label>
                                        <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="Your Company Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" 
                                            ErrorMessage="Company name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Phone Number</label>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+966 XXX XXX XXXX"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">User Type *</label>
                                        <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Select User Type" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Client - عميل" Value="Client"></asp:ListItem>
                                            <asp:ListItem Text="Supervisor - مشرف" Value="Supervisor"></asp:ListItem>
                                            <asp:ListItem Text="Worker - عامل" Value="Worker"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType" 
                                            ErrorMessage="User type is required" CssClass="text-danger" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Password *</label>
                                                <asp:TextBox ID="txtPasswordRegister" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPasswordRegister" runat="server" ControlToValidate="txtPasswordRegister" 
                                                    ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revPasswordRegister" runat="server" ControlToValidate="txtPasswordRegister"
                                                    ValidationExpression="^(?=.*[a-zA-Z])(?=.*\d).{6,}$"
                                                    ErrorMessage="Password must be at least 6 characters with letters and numbers" 
                                                    CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label">Confirm Password *</label>
                                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                                                    ErrorMessage="Please confirm password" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" 
                                                    ControlToCompare="txtPasswordRegister" ErrorMessage="Passwords do not match" 
                                                    CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group form-check">
                                        <asp:CheckBox ID="cbTerms" runat="server" CssClass="form-check-input" />
                                        <label class="form-check-label" for="<%= cbTerms.ClientID %>">
                                            I agree to the <a href="terms.aspx" target="_blank">Terms and Conditions</a> and <a href="privacy.aspx" target="_blank">Privacy Policy</a>
                                        </label>
                                        <asp:CustomValidator ID="cvTerms" runat="server" ErrorMessage="You must accept the terms and conditions" 
                                            CssClass="text-danger" Display="Dynamic" OnServerValidate="cvTerms_ServerValidate"></asp:CustomValidator>
                                    </div>

                                    <div class="form-group text-center mt-4">
                                        <asp:Button ID="btnRegister" runat="server" Text="Create Account" 
                                            CssClass="roaahub-btn-primary btn-lg btn-block" OnClick="btnRegister_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Account Types Info -->
    <section class="roaahub-section" style="background-color: #f8f9fa;">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <h2>Account Types</h2>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">👑</div>
                        <h4>Client - عميل</h4>
                        <p>Full access to all features, billing management, and company-wide settings</p>
                        <ul class="text-start">
                            <li>View all company data</li>
                            <li>Manage subscriptions</li>
                            <li>Access all reports</li>
                            <li>User management</li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">👨‍💼</div>
                        <h4>Supervisor - مشرف</h4>
                        <p>Management access to monitor operations and team performance</p>
                        <ul class="text-start">
                            <li>Monitor team activities</li>
                            <li>Generate reports</li>
                            <li>Manage workers</li>
                            <li>View operational data</li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">👷</div>
                        <h4>Worker - عامل</h4>
                        <p>Limited access for daily operations and task management</p>
                        <ul class="text-start">
                            <li>View assigned tasks</li>
                            <li>Update work status</li>
                            <li>Basic reporting</li>
                            <li>Personal dashboard</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        // Auto-hide alerts after 5 seconds
        setTimeout(function () {
            var alerts = document.querySelectorAll('.alert');
            alerts.forEach(function (alert) {
                var bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</asp:Content>