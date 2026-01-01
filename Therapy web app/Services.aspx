<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Therapy_web_app.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SereneMind Therapy – Restore Your Peace</title>
    <link rel="icon" type="image/jpg" href="logo.jpg" />
   
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        :root {
            --primary: #0D9488;
            --primary-light: #E6F4F1;
            --text: #1F2937;
            --text-light: #6B7280;
            --bg: #F9FAFB;
        }
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        
        /* Navbar */
        .navbar {
            background: white !important;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            padding: 0.8rem 0;
        }
        .navbar-brand { font-weight: 700; font-size: 1.5rem; color: var(--primary) !important; }
        .navbar-brand img { width: 40px; height: 40px; object-fit: contain; margin-right: 10px; }
        .navbar-nav .nav-link { color: #374151 !important; font-weight: 500; margin: 0 1rem; }
        .navbar-nav .nav-link:hover { color: var(--primary) !important; }
        .btn-book { padding: 0.5rem 1rem; border: 1px solid #D1D5DB; border-radius: 0.375rem; color: #374151; margin-right: 0.75rem; font-weight: 600; }
        .btn-book:hover { background: #F3F4F6; }
        .btn-started { background: var(--primary); color: white; padding: 0.5rem 1rem; border-radius: 0.375rem; font-weight: 600; }
        .btn-started:hover { background: #0b7a6f; color: white; }

        /* Top Features Section */
        .features-top {
            display: flex;
            justify-content: center;
            gap: 40px;
            padding: 60px 20px;
            background: var(--primary-light);
            flex-wrap: wrap;
            margin-top: 4rem; /* Separation from grid */
        }
        .feature-item {
            background: white;
            border-radius: 16px;
            padding: 32px 24px;
            width: 340px;
            text-align: center;
            transition: all 0.3s ease;
            color: var(--primary);
        }
        .feature-item:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(13,148,136,0.35), 0 0 15px rgba(13,148,136,0.45);
        }
        .feature-icon { width: 80px; height: 80px; margin: 0 auto 20px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 36px; background: white; color: var(--primary); }
        
        /* Main Services Section */
        .page-header { text-align: center; padding-top: 60px; padding-bottom: 20px; }
        .main-container { max-width: 1240px; margin: 0 auto; padding: 0 20px 60px 20px; }
        .badge-pill { display: inline-block; background: var(--primary-light); color: var(--primary); padding: 8px 20px; border-radius: 999px; font-size: 14px; font-weight: 600; margin-bottom: 16px; }
        h1 { font-size: 40px; font-weight: 700; color: var(--text); margin-bottom: 16px; }
        .subtitle { font-size: 18px; color: var(--text-light); max-width: 720px; margin: 0 auto 64px; }
        
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 40px;
            max-width: 1140px;
            margin: 0 auto;
        }
        .service-card {
            background: white;
            border-radius: 24px;
            padding: 48px 40px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            text-align: left;
            position: relative;
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 25px rgba(13,148,136,0.35), 0 0 15px rgba(13,148,136,0.45);
        }
        .popular-badge { position: absolute; top: 20px; right: 24px; background: var(--primary); color: white; font-size: 13px; font-weight: 600; padding: 6px 18px; border-radius: 50px; }
        .card-icon { width: 72px; height: 72px; border-radius: 18px; display: flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 28px; background: var(--primary-light); color: var(--primary); }
        
        .features-list { list-style: none; padding-left: 0; }
        .features-list li { position: relative; padding-left: 28px; margin-bottom: 12px; color: var(--text-light); }
        .features-list li::before {
            content: "\f00c"; /* Font Awesome check */
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            color: var(--primary);
            position: absolute;
            left: 0; top: 2px; font-size: 16px;
        }
        
        .price-amount { font-size: 32px; font-weight: 700; color: var(--primary); }
        .price-text { color: var(--text-light); }
        .service-card > p { color: var(--text-light); }
        
        .price-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .btn-learn { background: var(--primary); color: white; padding: 14px 32px; border: none; border-radius: 12px; font-weight: 600; cursor: pointer; transition: all 0.3s ease; }
        .btn-learn:hover { background: #0b7a6f; transform: translateY(-2px); }

        /* Footer Styles (Fixed) */
        .footer { background: var(--primary); color: white; margin-top: auto; }
        .footer-top { background: rgba(255,255,255,0.05); padding: 50px 20px; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .subscribe-box { display: inline-flex; margin-bottom: 20px; border-radius: 8px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.15); flex-wrap:wrap; justify-content:center; }
        .subscribe-input { padding: 14px 18px; width: 340px; border: none; background: white; color: #333; font-size: 15px; }
        .subscribe-btn { padding: 14px 32px; background: #0f766e; color: white; border: none; font-weight: bold; cursor: pointer; }
        .subscribe-btn:hover { background: #0d6e66; }
        .rating-text { font-size: 16px; font-weight: 500; }
        
        .footer-main { display: flex; justify-content: space-between; padding: 60px 0; flex-wrap: wrap; gap: 40px; }
        .footer-col { flex: 1; min-width: 200px; }
        .footer-col:first-child { min-width: 280px; } /* Give logo column more space */
        
        .footer h4 { color: white; font-size: 17px; margin-bottom: 20px; position: relative; }
        .footer h4 span { position: absolute; left: 0; bottom: -8px; width: 40px; height: 3px; background: #E6F4F1; border-radius: 2px; }
        
        .footer ul { list-style: none; padding: 0; }
        .footer ul li { margin-bottom: 12px; }
        .footer ul li a, .footer ul li { color: #E6F4F1; transition: 0.3s; text-decoration: none; }
        .footer ul li a:hover { color: white; padding-left: 5px; }
        
        .social-btn { display: inline-block; background: rgba(255,255,255,0.15); color: white; width: 40px; height: 40px; line-height: 40px; text-align: center; border-radius: 10px; margin-right: 10px; font-size: 16px; transition: 0.3s; }
        .social-btn:hover { background: white; color: var(--primary); transform: translateY(-3px); }
        
        .footer-bottom { background: rgba(0,0,0,0.2); padding: 25px 0; text-align: center; font-size: 14px; }
        .footer-bottom-content { display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px; color: #E6F4F1; }
        .footer-bottom a { color: #E6F4F1; margin: 0 12px; }

        /* Media Queries */
        @media (max-width: 1024px) {
            .services-grid { grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 30px; }
            .feature-item { width: 300px; padding: 28px 20px; }
            .service-card { padding: 36px 28px; }
        }
        @media (max-width: 768px) {
            .navbar-nav { flex-direction: column; align-items: center; }
            .navbar-nav .nav-link { margin: 0.25rem 0; }
            .services-grid { grid-template-columns: 1fr; gap: 25px; }
            .feature-item { width: 90%; padding: 24px 16px; }
            .footer-main { flex-direction: column; text-align: center; }
            .footer h4 span { left: 50%; transform: translateX(-50%); }
        }
    </style>
</head>
<body>
<form id="form2" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="logo.jpg" alt="Logo" />
                SereneMind <span style="color:#9CA3AF;">THERAPY</span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="About.aspx">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="Services.aspx">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="FAQs.aspx">FAQ</a></li>
                    <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                </ul>
                <div class="d-none d-lg-flex align-items-center">
                    <a href="Booking.aspx" class="btn btn-book"><i class="fa-solid fa-calendar"></i> <span>Book Session</span></a>
                    <a href="Login_Signup.aspx" class="btn btn-started"><i class="fa-solid fa-user"></i> <span>Account</span></a>
                </div>
            </div>
        </div>
    </nav>

    <div class="page-header">
        <div class="badge-pill">Our Services</div>
        <h1>Comprehensive Therapeutic Support</h1>
        <p class="subtitle">From mental wellbeing to personal growth – we provide holistic support for your healing journey.</p>
    </div>

    <div class="main-container">
        <div class="services-grid">
            
            <div class="service-card">
                <div class="card-icon">
                    <i class="fa-solid fa-brain"></i>
                </div>
                <h3>Cognitive Behavioral Therapy (CBT)</h3>
                <p>Structured, goal-oriented therapy that helps you identify and change negative thought patterns to improve mental wellbeing.</p>
                <ul class="features-list">
                    <li>One-on-one counseling sessions</li>
                    <li>Identify triggers & patterns</li>
                    <li>Anxiety & depression support</li>
                    <li>Practical coping strategies</li>
                </ul>
                <div class="price-section">
                    <div>
                        <div class="price-text">Starting from</div>
                        <div class="price-amount">Rs 3,500 <small>per session</small></div>
                    </div>
                    <button class="btn-learn" type="button">Book Now <i class="fa-solid fa-right-long"></i></button>
                </div>
            </div>

            <div class="service-card">
                <div class="popular-badge">Most Popular</div>
                <div class="card-icon">
                    <i class="fa-solid fa-people-roof"></i>
                </div>
                <h3>Family & Relationship Therapy</h3>
                <p>Counseling designed to resolve conflicts, improve communication, and strengthen bonds between couples and family members.</p>
                <ul class="features-list">
                    <li>Conflict resolution techniques</li>
                    <li>Parent-child relationship building</li>
                    <li>Joint therapy sessions</li>
                    <li>Healing emotional bonds</li>
                </ul>
                <div class="price-section">
                    <div>
                        <div class="price-text">Starting from</div>
                        <div class="price-amount">Rs 4,500 <small>per session</small></div>
                    </div>
                    <button class="btn-learn" type="button">Book Now <i class="fa-solid fa-right-long"></i></button>
                </div>
            </div>

            <div class="service-card">
                <div class="card-icon">
                    <i class="fa-solid fa-shapes"></i>
                </div>
                <h3>Play Therapy</h3>
                <p>A specialized approach for children to express their emotions, improve communication, and resolve challenges through play.</p>
                <ul class="features-list">
                    <li>Emotional expression tools</li>
                    <li>Behavioral improvement</li>
                    <li>Child-friendly environment</li>
                    <li>Trauma processing</li>
                </ul>
                <div class="price-section">
                    <div>
                        <div class="price-text">Starting from</div>
                        <div class="price-amount">Rs 2,500 <small>per session</small></div>
                    </div>
                    <button class="btn-learn" type="button">Book Now <i class="fa-solid fa-right-long"></i></button>
                </div>
            </div>

            <div class="service-card">
                <div class="popular-badge">High Demand</div>
                <div class="card-icon">
                    <i class="fa-solid fa-comments"></i>
                </div>
                <h3>Speech & Language Therapy</h3>
                <p>Expert support for children and adults facing challenges with speech, language development, and communication disorders.</p>
                <ul class="features-list">
                    <li>Articulation & phonology</li>
                    <li>Fluency building</li>
                    <li>Swallowing disorders</li>
                    <li>Confidence boosting</li>
                </ul>
                <div class="price-section">
                    <div>
                        <div class="price-text">Starting from</div>
                        <div class="price-amount">Rs 3,000 <small>per session</small></div>
                    </div>
                    <button class="btn-learn" type="button">Book Now <i class="fa-solid fa-right-long"></i></button>
                </div>
            </div>

        </div>
    </div>

    <div class="features-top">
        <div class="feature-item">
            <div class="feature-icon"><i class="fa-solid fa-users-rays"></i></div>
            <h3>Group Support Circles</h3>
            <p>Cost-effective group healing with peer interaction</p>
        </div>
        <div class="feature-item">
            <div class="feature-icon"><i class="fa-solid fa-clock"></i></div>
            <h3>Flexible Appointments</h3>
            <p>Book online sessions according to your availability</p>
        </div>
        <div class="feature-item">
            <div class="feature-icon"><i class="fa-solid fa-user-doctor"></i></div>
            <h3>Certified Specialists</h3>
            <p>PMDC Licensed & Certified Clinical Psychologists</p>
        </div>
    </div>

    <footer class="footer">
        <div class="footer-top">
            <div class="subscribe-box">
                <input type="email" placeholder="Enter your email for wellness tips" class="subscribe-input" />
                <button type="button" class="subscribe-btn">Subscribe</button>
            </div>
            <div class="rating-text">
                <span style="color: #FFD700; margin-right: 8px;">1000+ Happy Patients</span> |
                <span style="margin-left: 12px;">
                    <i class="fas fa-star" style="color: #FFD700;"></i>
                    <i class="fas fa-star" style="color: #FFD700;"></i>
                    <i class="fas fa-star" style="color: #FFD700;"></i>
                    <i class="fas fa-star" style="color: #FFD700;"></i>
                    <i class="fas fa-star" style="color: #FFD700;"></i>
                    <strong style="margin-left: 6px; color: white;">Verified Reviews</strong>
                </span>
            </div>
        </div>

        <div class="container footer-main">
            <div class="footer-col">
                <div style="margin-bottom: 20px;">
                    <img src="logo.jpg" style="width: 40px; height: 40px; object-fit: contain; margin-right: 10px; vertical-align: middle; background:white; border-radius:50%;" alt="Logo"/>
                    <div style="display: inline-block; vertical-align: middle;">
                        <strong style="font-size: 26px; color: white;">SereneMind</strong><br />
                        <span style="color: #E6F4F1; font-size: 14px;">Therapy</span>
                    </div>
                </div>
                <p style="line-height: 1.5; color: #E6F4F1; margin: 10px 0;">
                    Compassionate mental health care for a balanced life. We provide a safe space for healing, growth, and self-discovery.
                </p>
                <div style="background: rgba(255,255,255,0.15); padding: 8px 14px; border-radius: 6px; display: inline-block; font-size: 13px;">
                    <i class="fas fa-shield-heart"></i> HIPAA Compliant & Secure
                </div>
            </div>

            <div class="footer-col">
                <h4>Quick Links<span></span></h4>
                <ul>
                    <li><a href="Home.aspx">Home</a></li>
                    <li><a href="About.aspx">About</a></li>
                    <li><a href="Services.aspx">Services</a></li>
                    <li><a href="FAQs.aspx">FAQ</a></li>
                    <li><a href="Contact.aspx">Contact Us</a></li>
                </ul>
            </div>

            <div class="footer-col">
                <h4>Therapy Services<span></span></h4>
                <ul>
                    <li>Individual Counseling</li>
                    <li>Couples Therapy</li>
                    <li>Anxiety & Depression</li>
                    <li>Trauma Recovery</li>
                    <li>Child Psychology</li>
                    <li>Stress Management</li>
                </ul>
            </div>

            <div class="footer-col">
                <h4>Contact Clinic<span></span></h4>
                <div style="margin-bottom: 15px; color: #E6F4F1;">
                    <i class="fas fa-envelope" style="margin-right: 12px;"></i> help@serenemind.pk
                </div>
                <div style="margin-bottom: 15px; color: #E6F4F1;">
                    <i class="fas fa-phone" style="margin-right: 12px;"></i> +92 300 1234567
                </div>
                <div style="margin-bottom: 15px; color: #E6F4F1;">
                    <i class="fas fa-location-dot" style="margin-right: 12px;"></i> Main Clifton Rd, Karachi
                </div>
                
                <h5 style="color: white; margin: 20px 0 15px;">Follow Us</h5>
                <div class="social-links">
                    <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social-btn"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="social-btn"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="container footer-bottom-content">
                <div>© 2025 SereneMind Therapy. All rights reserved.</div>
                <div>
                    <a href="PrivacyPolicy.aspx">Privacy Policy</a> |
                    <a href="MedicalDisclamier.aspx">Medical Disclaimer</a>
                </div>
                <div>Caring with <span style="color: #ff6b6b; font-size: 16px;"><i class="fas fa-heart"></i></span></div>
            </div>
        </div>
    </footer>
</form>
</body>
</html>