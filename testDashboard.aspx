<%@ Page Title="Quick Dashboard Links" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="testDashboard.aspx.cs" Inherits="roaahub.testDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        :root {
            --primary-color: #4caf50;
            --secondary-color: #8bc34a;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
            --light-bg: #f8f9fa;
            --dark-text: #333;
            --gray-text: #666;
        }

        .quick-links-container {
            background: #f5f7fb;
            min-height: 100vh;
            padding: 20px;
        }

        .header-section {
            background: white;
            padding: 30px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            text-align: center;
        }

        .header-section h1 {
            color: var(--dark-text);
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .header-section p {
            color: var(--gray-text);
            font-size: 16px;
            margin-bottom: 0;
        }

        .links-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .quick-link-card {
            background: white;
            border-radius: 15px;
            padding: 30px 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: 2px solid transparent;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .quick-link-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            border-color: var(--primary-color);
        }

        .link-icon {
            font-size: 48px;
            margin-bottom: 20px;
            display: block;
        }

        .link-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 15px;
        }

        .link-description {
            color: var(--gray-text);
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .btn-quick-link {
            display: inline-block;
            padding: 12px 30px;
            background: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: 2px solid var(--primary-color);
        }

        .btn-quick-link:hover {
            background: transparent;
            color: var(--primary-color);
            text-decoration: none;
        }

        .status-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 500;
        }

        .status-active {
            background: #e7f7ef;
            color: var(--success-color);
        }

        .status-inactive {
            background: #fef0f0;
            color: var(--danger-color);
        }

        .category-section {
            margin-bottom: 40px;
        }

        .category-title {
            font-size: 24px;
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light-bg);
        }

        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 30px;
        }

        .stat-item {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .stat-number {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 12px;
            color: var(--gray-text);
            text-transform: uppercase;
            font-weight: 500;
        }

        .recent-activity {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .activity-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--dark-text);
            margin-bottom: 20px;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #f0f0f0;
        }

        .activity-item:last-child {
            border-bottom: none;
        }

        .activity-icon {
            font-size: 20px;
            margin-right: 15px;
            width: 30px;
            text-align: center;
        }

        .activity-content {
            flex: 1;
        }

        .activity-text {
            font-size: 14px;
            color: var(--dark-text);
            margin-bottom: 2px;
        }

        .activity-time {
            font-size: 12px;
            color: var(--gray-text);
        }

        /* Special styles for different categories */
        .agriculture-card { border-left: 4px solid #4caf50; }
        .sales-card { border-left: 4px solid #2196f3; }
        .inventory-card { border-left: 4px solid #ff9800; }
        .finance-card { border-left: 4px solid #9c27b0; }
        .hr-card { border-left: 4px solid #f44336; }
        .analytics-card { border-left: 4px solid #607d8b; }
        .management-card { border-left: 4px solid #795548; }

        .agriculture-card .btn-quick-link { background: #4caf50; border-color: #4caf50; }
        .sales-card .btn-quick-link { background: #2196f3; border-color: #2196f3; }
        .inventory-card .btn-quick-link { background: #ff9800; border-color: #ff9800; }
        .finance-card .btn-quick-link { background: #9c27b0; border-color: #9c27b0; }
        .hr-card .btn-quick-link { background: #f44336; border-color: #f44336; }
        .analytics-card .btn-quick-link { background: #607d8b; border-color: #607d8b; }
        .management-card .btn-quick-link { background: #795548; border-color: #795548; }

        .agriculture-card:hover .btn-quick-link:hover { color: #4caf50; }
        .sales-card:hover .btn-quick-link:hover { color: #2196f3; }
        .inventory-card:hover .btn-quick-link:hover { color: #ff9800; }
        .finance-card:hover .btn-quick-link:hover { color: #9c27b0; }
        .hr-card:hover .btn-quick-link:hover { color: #f44336; }
        .analytics-card:hover .btn-quick-link:hover { color: #607d8b; }
        .management-card:hover .btn-quick-link:hover { color: #795548; }

        @media (max-width: 768px) {
            .links-grid {
                grid-template-columns: 1fr;
            }
            
            .header-section {
                padding: 20px;
            }
            
            .header-section h1 {
                font-size: 24px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="quick-links-container">
        <!-- Header Section -->
        <div class="header-section">
            <h1>🚀 الروابط السريعة للداش بوردات</h1>
            <p>وصول سريع إلى جميع لوحات التحكم والإدارة في النظام</p>
        </div>

        <!-- Quick Stats -->
        <div class="stats-bar">
            <div class="stat-item">
                <div class="stat-number" id="totalDashboards" runat="server">8</div>
                <div class="stat-label">لوحات التحكم</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="activeServices" runat="server">6</div>
                <div class="stat-label">خدمات نشطة</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="dbStatus" runat="server">🟢</div>
                <div class="stat-label">حالة قاعدة البيانات</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="lastUpdate" runat="server">الآن</div>
                <div class="stat-label">آخر تحديث</div>
            </div>
        </div>

        <!-- Agriculture Category -->
        <div class="category-section">
            <h3 class="category-title">🌾 الزراعة والمزارع</h3>
            <div class="links-grid">
                <!-- Palm Dashboard -->
                <div class="quick-link-card agriculture-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">🌴</div>
                    <div class="link-title">داش بورد النخيل</div>
                    <div class="link-description">
                        إدارة مزارع النخيل، متابعة الإنتاج، مراقبة الصحة، وجدولة الري
                    </div>
                    <asp:HyperLink ID="hlPalmDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/palmDashboard.aspx">
                        الدخول إلى لوحة النخيل
                    </asp:HyperLink>
                </div>

                <!-- Farm Management -->
                <div class="quick-link-card agriculture-card">
                    <div class="link-icon">🚜</div>
                    <div class="link-title">إدارة المزارع</div>
                    <div class="link-description">
                        إدارة جميع المزارع، توزيع الموارد، ومتابعة العمليات اليومية
                    </div>
                    <asp:HyperLink ID="hlFarmManagement" runat="server" CssClass="btn-quick-link" NavigateUrl="~/FarmManagement.aspx">
                        إدارة المزارع
                    </asp:HyperLink>
                </div>

                <!-- Harvest Tracking -->
                <div class="quick-link-card agriculture-card">
                    <div class="link-icon">📊</div>
                    <div class="link-title">تتبع الحصاد</div>
                    <div class="link-description">
                        متابعة مواسم الحصاد، جودة المحصول، وتقارير الإنتاجية
                    </div>
                    <asp:HyperLink ID="hlHarvestTracking" runat="server" CssClass="btn-quick-link" NavigateUrl="~/HarvestTracking.aspx">
                        تتبع الحصاد
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Business Operations -->
        <div class="category-section">
            <h3 class="category-title">💼 العمليات التجارية</h3>
            <div class="links-grid">
                <!-- Sales Dashboard -->
                <div class="quick-link-card sales-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">💰</div>
                    <div class="link-title">داش بورد المبيعات</div>
                    <div class="link-description">
                        متابعة المبيعات، إدارة العملاء، وتحليل أداء الفريق البيعي
                    </div>
                    <asp:HyperLink ID="hlSalesDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/SalesDashboard.aspx">
                        لوحة المبيعات
                    </asp:HyperLink>
                </div>

                <!-- Inventory Management -->
                <div class="quick-link-card inventory-card">
                    <div class="link-icon">📦</div>
                    <div class="link-title">إدارة المخزون</div>
                    <div class="link-description">
                        مراقبة المخزون، إدارة المستودعات، وتنبيهات نفاد المنتجات
                    </div>
                    <asp:HyperLink ID="hlInventoryDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/InventoryDashboard.aspx">
                        إدارة المخزون
                    </asp:HyperLink>
                </div>

                <!-- Financial Dashboard -->
                <div class="quick-link-card finance-card">
                    <div class="link-icon">🏦</div>
                    <div class="link-title">الداش بورد المالي</div>
                    <div class="link-description">
                        الحسابات المالية، التدفق النقدي، المصروفات، وتقارير الربحية
                    </div>
                    <asp:HyperLink ID="hlFinancialDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/FinancialDashboard.aspx">
                        التقارير المالية
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Management & Analytics -->
        <div class="category-section">
            <h3 class="category-title">📈 الإدارة والتحليلات</h3>
            <div class="links-grid">
                <!-- HR Dashboard -->
                <div class="quick-link-card hr-card">
                    <div class="link-icon">👥</div>
                    <div class="link-title">الموارد البشرية</div>
                    <div class="link-description">
                        إدارة الموظفين، الحضور والانصراف، الرواتب، وتقييم الأداء
                    </div>
                    <asp:HyperLink ID="hlHRDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/HRDashboard.aspx">
                        إدارة الموظفين
                    </asp:HyperLink>
                </div>

                <!-- Analytics Dashboard -->
                <div class="quick-link-card analytics-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">📈</div>
                    <div class="link-title">التحليلات الشاملة</div>
                    <div class="link-description">
                        تحليلات متقدمة، رسوم بيانية تفاعلية، ومؤشرات أداء رئيسية
                    </div>
                    <asp:HyperLink ID="hlAnalyticsDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/AnalyticsDashboard.aspx">
                        لوحة التحليلات
                    </asp:HyperLink>
                </div>

                <!-- Dashboard Manager -->
                <div class="quick-link-card management-card">
                    <div class="link-icon">⚙️</div>
                    <div class="link-title">مدير الداش بوردات</div>
                    <div class="link-description">
                        مراقبة حالة النظام، فحص الاتصالات، وإدارة جميع اللوحات
                    </div>
                    <asp:HyperLink ID="hlDashboardManager" runat="server" CssClass="btn-quick-link" NavigateUrl="~/DashboardManager.aspx">
                        إدارة النظام
                    </asp:HyperLink>
                </div>
            </div>
        </div>
                <!-- Client & Customer Management -->
        <div class="category-section">
            <h3 class="category-title">👥 إدارة العملاء والعملاء</h3>
            <div class="links-grid">
                <!-- Client Dashboard -->
                <div class="quick-link-card client-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">👨‍💼</div>
                    <div class="link-title">داش بورد العملاء</div>
                    <div class="link-description">
                        إدارة بيانات العملاء، متابعة التعاملات، وتحليل سلوك العملاء
                    </div>
                    <asp:HyperLink ID="hlClientDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/clientDashboard.aspx">
                        لوحة العملاء
                    </asp:HyperLink>
                </div>

                <!-- Customer Portal -->
                <div class="quick-link-card client-card">
                    <div class="link-icon">🌐</div>
                    <div class="link-title">بوابة العملاء</div>
                    <div class="link-description">
                        واجهة العملاء لمتابعة الطلبات والفواتير والخدمات
                    </div>
                    <asp:HyperLink ID="hlCustomerPortal" runat="server" CssClass="btn-quick-link" NavigateUrl="~/CustomerPortal.aspx">
                        بوابة العملاء
                    </asp:HyperLink>
                </div>

                <!-- Support System -->
                <div class="quick-link-card client-card">
                    <div class="link-icon">🎧</div>
                    <div class="link-title">نظام الدعم الفني</div>
                    <div class="link-description">
                        إدارة تذاكر الدعم، متابعة الشكاوى، وخدمة العملاء
                    </div>
                    <asp:HyperLink ID="hlSupportSystem" runat="server" CssClass="btn-quick-link" NavigateUrl="~/SupportSystem.aspx">
                        الدعم الفني
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Logistics & Supply Chain -->
        <div class="category-section">
            <h3 class="category-title">🚚 الخدمات اللوجستية وسلاسل التوريد</h3>
            <div class="links-grid">
                <!-- Cold Chain Dashboard -->
                <div class="quick-link-card logistics-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">❄️</div>
                    <div class="link-title">سلسلة التبريد</div>
                    <div class="link-description">
                        مراقبة درجة الحرارة، متابعة الشحنات المبردة، وإدارة المخازن المبردة
                    </div>
                    <asp:HyperLink ID="hlColdchainDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/coldchainDashboard.aspx">
                        سلسلة التبريد
                    </asp:HyperLink>
                </div>

                <!-- Fleet Management -->
                <div class="quick-link-card logistics-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">🚛</div>
                    <div class="link-title">إدارة الأسطول</div>
                    <div class="link-description">
                        تتبع المركبات، إدارة الصيانة، متابعة السائقين، وتحسين المسارات
                    </div>
                    <asp:HyperLink ID="hlFleetDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/fleetDashboard.aspx">
                        إدارة الأسطول
                    </asp:HyperLink>
                </div>

                <!-- Dozr Dashboard -->
                <div class="quick-link-card logistics-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">🚜</div>
                    <div class="link-title">إدارة المعدات</div>
                    <div class="link-description">
                        متابعة المعدات الثقيلة، جدولة الصيانة، وإدارة المشغليين
                    </div>
                    <asp:HyperLink ID="hlDozrDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/dozrDashboard.aspx">
                        إدارة المعدات
                    </asp:HyperLink>
                </div>

                <!-- Supply Chain -->
                <div class="quick-link-card logistics-card">
                    <div class="link-icon">📦</div>
                    <div class="link-title">إدارة سلسلة التوريد</div>
                    <div class="link-description">
                        متابعة سلسلة التوريد، إدارة الموردين، وتحسين العمليات اللوجستية
                    </div>
                    <asp:HyperLink ID="hlSupplyChain" runat="server" CssClass="btn-quick-link" NavigateUrl="~/SupplyChain.aspx">
                        سلسلة التوريد
                    </asp:HyperLink>
                </div>
            </div>
        </div>

        <!-- Energy & Utilities -->
        <div class="category-section">
            <h3 class="category-title">⚡ الطاقة والمرافق</h3>
            <div class="links-grid">
                <!-- Energy Dashboard -->
                <div class="quick-link-card energy-card">
                    <span class="status-badge status-active">نشط</span>
                    <div class="link-icon">⚡</div>
                    <div class="link-title">داش بورد الطاقة</div>
                    <div class="link-description">
                        مراقبة استهلاك الطاقة، إدارة المصادر، وتحسين كفاءة الاستخدام
                    </div>
                    <asp:HyperLink ID="hlEnergyDashboard" runat="server" CssClass="btn-quick-link" NavigateUrl="~/energyDashboard.aspx">
                        إدارة الطاقة
                    </asp:HyperLink>
                </div>

                <!-- Water Management -->
                <div class="quick-link-card energy-card">
                    <div class="link-icon">💧</div>
                    <div class="link-title">إدارة المياه</div>
                    <div class="link-description">
                        مراقبة استهلاك المياه، إدارة مصادر الري، وتحسين كفاءة الاستخدام
                    </div>
                    <asp:HyperLink ID="hlWaterManagement" runat="server" CssClass="btn-quick-link" NavigateUrl="~/WaterManagement.aspx">
                        إدارة المياه
                    </asp:HyperLink>
                </div>

                <!-- Sustainability -->
                <div class="quick-link-card energy-card">
                    <div class="link-icon">🌱</div>
                    <div class="link-title">الاستدامة البيئية</div>
                    <div class="link-description">
                        متابعة البصمة الكربونية، تقارير الاستدامة، ومبادرات البيئة
                    </div>
                    <asp:HyperLink ID="hlSustainability" runat="server" CssClass="btn-quick-link" NavigateUrl="~/Sustainability.aspx">
                        الاستدامة
                    </asp:HyperLink>
                </div>
            </div>
        </div>
        <!-- Recent Activity -->
        <div class="recent-activity">
            <h4 class="activity-title">🕒 النشاط الأخير</h4>
            <div class="activity-item">
                <div class="activity-icon">🌴</div>
                <div class="activity-content">
                    <div class="activity-text">تم تحديث بيانات مزرعة النخيل الرئيسية</div>
                    <div class="activity-time">منذ 5 دقائق</div>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">💰</div>
                <div class="activity-content">
                    <div class="activity-text">تم تسجيل عملية بيع جديدة بقيمة 5,000 ريال</div>
                    <div class="activity-time">منذ 15 دقيقة</div>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">📦</div>
                <div class="activity-content">
                    <div class="activity-text">تم تحديث مستوى المخزون لمنتجات التمور</div>
                    <div class="activity-time">منذ 30 دقيقة</div>
                </div>
            </div>
            <div class="activity-item">
                <div class="activity-icon">👥</div>
                <div class="activity-content">
                    <div class="activity-text">تم تسجيل حضور 25 موظف لهذا اليوم</div>
                    <div class="activity-time">منذ ساعة واحدة</div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>