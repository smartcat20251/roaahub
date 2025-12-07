<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="roaahub.about" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <!-- Hero Section -->
    <section class="roaahub-hero">
        <div class="container">
            <h1>About Roaahub</h1>
            <p class="lead">National IoT & Fleet Tracking Platform by Smartcat Company</p>
        </div>
    </section>

    <!-- About Content -->
    <section class="roaahub-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>Who Are We?</h2>
                    <p>Roaahub is a national platform that has set its sights on a firm goal: to provide the best solutions and services in the field of tracking and managing fleets of all kinds, to organize various businesses.</p>
                    
                    <p>We are one product that belongs to Smartcat company aiming to deliver a powerful combination of comprehensive technical expertise and deep collaborative partnerships.</p>
                    
                    <p>National Hub that has set its sights on a firm goal which is to provide the best tracking and IoT Systems solutions and Services.</p>
                </div>
                
                <div class="col-md-6">
                    <img src="https://via.placeholder.com/600x400/2c3e50/ffffff?text=About+Roaahub" alt="About Roaahub" class="roaahub-responsive-img" style="border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);" />
                </div>
            </div>

            <!-- Vision & Mission -->
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🎯</div>
                        <h3>Our Vision</h3>
                        <p>Achieve success by providing innovative Tracking and IoT Hub to serve wide range of the City.</p>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🚀</div>
                        <h3>Our Mission</h3>
                        <p>Enrich Saudi Market through creative and unique Hub adopted with global best practices, complying to local regulations.</p>
                    </div>
                </div>
            </div>

            <!-- Our Values -->
            <div class="row mt-5">
                <div class="col-md-12 text-center">
                    <h2>Our Values</h2>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🔄</div>
                        <h4>Adaptation</h4>
                        <p>Continuously evolving to meet market needs and technological advancements.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">🤝</div>
                        <h4>Collaboration</h4>
                        <p>Working together with clients and partners to achieve mutual success.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box text-center">
                        <div class="service-icon">✅</div>
                        <h4>Commitment</h4>
                        <p>Dedicated to delivering excellence and meeting client expectations.</p>
                    </div>
                </div>
            </div>

            <!-- Our Team -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h2 class="text-center">Our Team</h2>
                    <p class="text-center lead">Roaahub is proud of its local and international experienced teams that meet our client's expectations for successful projects delivery.</p>
                    
                    <p class="text-center">Our corporate culture focuses on converting technical requirements into real use case can be utilized for ultimate goals.</p>
                </div>
            </div>

            <!-- Why Choose Us -->
            <div class="row mt-5">
                <div class="col-md-12">
                    <h2 class="text-center">Why Choose Roaahub?</h2>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box">
                        <h4>Local Expertise</h4>
                        <p>Deep understanding of Saudi market requirements and regulations.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box">
                        <h4>Global Standards</h4>
                        <p>Adoption of international best practices in IoT and tracking solutions.</p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="roaahub-feature-box">
                        <h4>Comprehensive Solutions</h4>
                        <p>End-to-end services covering multiple industries and use cases.</p>
                    </div>
                </div>
            </div>

            <!-- CTA Section -->
            <div class="row mt-5">
                <div class="col-md-12 text-center">
                    <h3>Partner with Us</h3>
                    <p class="lead">Join the growing number of businesses trusting Roaahub for their IoT and tracking needs</p>
                    <div class="mt-4">
                        <a runat="server" href="~/contact.aspx" class="roaahub-btn-primary" style="margin-right: 15px;">Contact Us</a>
                        <a runat="server" href="~/requestDemo.aspx" class="roaahub-btn-outline">Request Demo</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>