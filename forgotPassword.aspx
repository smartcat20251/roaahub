<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="roaahub.forgotPassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Forgot Password</h1>
            <p class="lead">Reset your password to access your account</p>
        </div>
    </section>

    <!-- Forgot Password Form -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="roaahub-feature-box">
                        <h2 class="text-center">Reset Password</h2>
                        <p class="text-center">Enter your email address and we'll send you instructions to reset your password</p>
                        
                        <!-- Success/Error Messages -->
                        <div id="alertContainer">
                            <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-message"></asp:Label>
                        </div>

                        <div class="form-horizontal mt-4">
                            <div class="form-group">
                                <label class="control-label">Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your registered email" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group text-center mt-4">
                                <asp:Button ID="btnReset" runat="server" Text="Send Reset Instructions" 
                                    CssClass="roaahub-btn-primary btn-lg btn-block" OnClick="btnReset_Click" />
                            </div>

                            <div class="text-center mt-3">
                                <p>Remember your password? <a runat="server" href="~/login.aspx">Back to Login</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Support Section -->
    <section class="roaahub-section" style="background-color: #f8f9fa;">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <h3>Need Help?</h3>
                    <p>If you're having trouble accessing your account, contact our support team</p>
                    <div class="mt-3">
                        <a runat="server" href="~/contact.aspx" class="roaahub-btn-outline">Contact Support</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>