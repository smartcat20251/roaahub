<%@ Page Title="Request Demo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="requestDemo.aspx.cs" Inherits="roaahub.requestDemo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>Request a Demo</h1>
            <p class="lead">See our platform in action and discover how Roaahub can transform your operations</p>
        </div>
    </section>

    <!-- Demo Request Form -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="roaahub-feature-box">
                        <h2 class="text-center">Schedule Your Personalized Demo</h2>
                        <p class="text-center">Fill out the form below and our team will contact you to schedule a demo tailored to your specific needs.</p>
                        
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
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                                    ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ErrorMessage="Invalid email format" CssClass="text-danger" Display="Dynamic"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Company *</label>
                                <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="Your Company Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" 
                                    ErrorMessage="Company name is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Job Title</label>
                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="Your Job Title"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Phone Number *</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+966 XXX XXX XXXX"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                                    ErrorMessage="Phone number is required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Interested In *</label>
                                <asp:DropDownList ID="ddlInterest" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select a service..." Value=""></asp:ListItem>
                                    <asp:ListItem Text="ROAA - FLEET" Value="fleet"></asp:ListItem>
                                    <asp:ListItem Text="ROAA - COLD CHAIN" Value="coldchain"></asp:ListItem>
                                    <asp:ListItem Text="ROAA - PALM" Value="palm"></asp:ListItem>
                                    <asp:ListItem Text="ROAA - DOZR" Value="dozr"></asp:ListItem>
                                    <asp:ListItem Text="ROAA - ENERGY" Value="energy"></asp:ListItem>
                                    <asp:ListItem Text="FRESH TRACKING" Value="fresh-tracking"></asp:ListItem>
                                    <asp:ListItem Text="Multiple Services" Value="multiple"></asp:ListItem>
                                    <asp:ListItem Text="Full Platform" Value="platform"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvInterest" runat="server" ControlToValidate="ddlInterest" 
                                    ErrorMessage="Please select an interest" CssClass="text-danger" Display="Dynamic" InitialValue=""></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Company Size</label>
                                <asp:DropDownList ID="ddlCompanySize" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="1-10 employees" Value="1-10"></asp:ListItem>
                                    <asp:ListItem Text="11-50 employees" Value="11-50"></asp:ListItem>
                                    <asp:ListItem Text="51-200 employees" Value="51-200"></asp:ListItem>
                                    <asp:ListItem Text="201-500 employees" Value="201-500"></asp:ListItem>
                                    <asp:ListItem Text="501-1000 employees" Value="501-1000"></asp:ListItem>
                                    <asp:ListItem Text="1000+ employees" Value="1000+"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Specific Requirements or Questions</label>
                                <asp:TextBox ID="txtRequirements" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                    Rows="4" placeholder="Tell us about your specific needs, challenges, or any questions you have..."></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Preferred Demo Date</label>
                                <asp:TextBox ID="txtDemoDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="control-label">Preferred Time</label>
                                <asp:DropDownList ID="ddlTime" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Morning (9 AM - 12 PM)" Value="morning"></asp:ListItem>
                                    <asp:ListItem Text="Afternoon (1 PM - 5 PM)" Value="afternoon"></asp:ListItem>
                                    <asp:ListItem Text="No preference" Value="any"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group text-center mt-4">
                                <asp:Button ID="btnSubmit" runat="server" Text="Request Demo" 
                                    CssClass="roaahub-btn-primary btn-lg" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear Form" 
                                    CssClass="roaahub-btn-outline btn-lg" OnClick="btnClear_Click" CausesValidation="false" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Next Steps -->
    <section class="roaahub-section" style="background-color: #f8f9fa;">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-12">
                    <h2>What Happens Next?</h2>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">📞</div>
                        <h4>1. We Contact You</h4>
                        <p>Our team will reach out within 24 hours to confirm your demo request</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🎯</div>
                        <h4>2. Personalized Setup</h4>
                        <p>We prepare a demo tailored to your specific business needs</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">💻</div>
                        <h4>3. Live Demo</h4>
                        <p>Join a live session with our experts to see the platform in action</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>