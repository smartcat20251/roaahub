<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="roaahub.register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Create New Account</h1>
            <p class="lead">Join Roaahub platform and manage your IoT solutions</p>
        </div>
    </section>

    <!-- Registration Form -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="roaahub-feature-box">
                        <h2 class="text-center">Create Account</h2>
                        <p class="text-center">Fill out the form below to create your account</p>
                        
                        <!-- Success/Error Messages -->
                        <div id="alertContainer">
                            <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-message"></asp:Label>
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
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
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
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                                            ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
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
                                            ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" 
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

                            <div class="text-center mt-3">
                                <p>Already have an account? <a runat="server" href="~/login.aspx">Sign In</a></p>
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
</asp:Content>