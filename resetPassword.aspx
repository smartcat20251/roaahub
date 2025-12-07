<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="roaahub.resetPassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Reset Password</h1>
            <p class="lead">Create a new password for your account</p>
        </div>
    </section>

    <!-- Reset Password Form -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="roaahub-feature-box">
                        <h2 class="text-center">Set New Password</h2>
                        <p class="text-center">Enter your new password below</p>
                        
                        <!-- Success/Error Messages -->
                        <div id="alertContainer">
                            <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-message"></asp:Label>
                        </div>

                        <asp:HiddenField ID="hdnToken" runat="server" />

                        <div class="form-horizontal mt-4">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">New Password *</label>
                                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" 
                                            ErrorMessage="New password is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revNewPassword" runat="server" ControlToValidate="txtNewPassword"
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
                                            ControlToCompare="txtNewPassword" ErrorMessage="Passwords do not match" 
                                            CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center mt-4">
                                <asp:Button ID="btnReset" runat="server" Text="Reset Password" 
                                    CssClass="roaahub-btn-primary btn-lg btn-block" OnClick="btnReset_Click" />
                            </div>

                            <div class="text-center mt-3">
                                <p><a runat="server" href="~/login.aspx">Back to Login</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>