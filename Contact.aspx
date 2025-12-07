<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="roaahub.contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Contact Us</h1>
            <p class="lead">Get in touch with our team - We're here to help</p>
        </div>
    </section>

    <!-- Contact Content -->
    <section class="roaahub-section">
        <div class="container">
            <!-- Success/Error Messages -->
            <div class="row">
                <div class="col-md-12">
                    <div id="alertContainer">
                        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="alert-message"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="roaahub-feature-box">
                        <h2><i class="fas fa-envelope"></i> Send us a Message</h2>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label">Your Name *</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                                    ErrorMessage="Name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ErrorMessage="Invalid email format" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Subject *</label>
                                <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter message subject"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" 
                                    ErrorMessage="Subject is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Message *</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                    Rows="6" placeholder="Enter your message here..."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" 
                                    ErrorMessage="Message is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send Message" 
                                    CssClass="roaahub-btn-primary btn-lg" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear Form" 
                                    CssClass="roaahub-btn-secondary btn-lg" OnClick="btnClear_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="roaahub-feature-box">
                        <h3><i class="fas fa-info-circle"></i> Contact Information</h3>
                        <div class="contact-details">
                            <div class="contact-item" style="display: flex; align-items: center; margin-bottom: 20px;">
                                <div class="contact-icon" style="font-size: 1.5rem; color: #3498db; margin-right: 15px;">
                                    <i class="fas fa-phone"></i>
                                </div>
                                <div class="contact-content">
                                    <h4 style="margin: 0; font-size: 1.1rem;">Phone</h4>
                                    <p style="margin: 0;">+966 56 643 9605</p>
                                </div>
                            </div>

                            <div class="contact-item" style="display: flex; align-items: center; margin-bottom: 20px;">
                                <div class="contact-icon" style="font-size: 1.5rem; color: #3498db; margin-right: 15px;">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div class="contact-content">
                                    <h4 style="margin: 0; font-size: 1.1rem;">Email</h4>
                                    <p style="margin: 0;">info@roaahub.com</p>
                                </div>
                            </div>

                            <div class="contact-item" style="display: flex; align-items: center; margin-bottom: 20px;">
                                <div class="contact-icon" style="font-size: 1.5rem; color: #3498db; margin-right: 15px;">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="contact-content">
                                    <h4 style="margin: 0; font-size: 1.1rem;">Address</h4>
                                    <p style="margin: 0;">Riyadh, Saudi Arabia</p>
                                </div>
                            </div>

                            <div class="contact-item" style="display: flex; align-items: center; margin-bottom: 20px;">
                                <div class="contact-icon" style="font-size: 1.5rem; color: #3498db; margin-right: 15px;">
                                    <i class="fas fa-clock"></i>
                                </div>
                                <div class="contact-content">
                                    <h4 style="margin: 0; font-size: 1.1rem;">Business Hours</h4>
                                    <p style="margin: 0;">Sunday - Thursday: 8:00 AM - 5:00 PM</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section class="roaahub-section" style="background-color: #f8f9fa;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🗺️</div>
                        <h3>Our Location</h3>
                        <p>Riyadh, Saudi Arabia - Our headquarters location</p>
                        <div class="mt-3">
                            <img src="https://via.placeholder.com/800x400/ecf0f1/34495e?text=Riyadh%2C+Saudi+Arabia+Map" alt="Location Map" class="roaahub-responsive-img" style="border-radius: 10px; max-width: 100%;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>