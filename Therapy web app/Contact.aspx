<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Therapy_web_app.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SereneMind Therapy – Restore Your Peace</title>
    <link rel="icon" type="image/jpg" href="logo.jpg" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
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
        body, html {
            margin: 0; padding: 0; font-family: 'Inter', sans-serif; background: white; color: var(--text);
        }
        a { text-decoration: none; }
        .navbar { background: white !important; box-shadow: 0 1px 3px rgba(0,0,0,0.1); padding: 1rem 0; }
        .navbar-brand { font-weight: 700; font-size: 1.5rem; color: var(--primary) !important; }
        .navbar-brand img { width: 40px; height: 40px; object-fit: contain; margin-right: 10px; }
        .navbar-nav .nav-link { color: #374151 !important; font-weight: 500; margin: 0 1rem; }
        .navbar-nav .nav-link:hover { color: var(--primary) !important; }
        .btn-book { padding: 0.5rem 1rem; border: 1px solid #D1D5DB; border-radius: 0.375rem; color: #374151; margin-right: 0.75rem; font-weight: 600; }
        .btn-book:hover { background: #F3F4F6; }
        .btn-started { background: var(--primary); color: white; padding: 0.5rem 1rem; border-radius: 0.375rem; font-weight: 600; }
        .btn-started:hover { background: #0b7a6f; color: white; }

        /* Support Page Specific Styles */
        .support-section {
            background: var(--bg);
            padding: 6rem 0 4rem;
        }
        .support-title {
            font-size: 2.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 1rem;
        }
        .support-subtitle {
            color: var(--text-light);
            text-align: center;
            margin-bottom: 4rem;
            font-size: 1.1rem;
        }

        /* Updated support card styles */
        .support-card {
            background: white;
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            text-align: center;
            min-height: 380px; /* Ensures all cards have same height */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: all 0.3s ease;
        }

        /* Glowy green effect on hover */
        .support-card:hover {
            box-shadow: 0 0 30px rgba(13, 148, 136, 0.5);
            border: 1px solid rgba(13, 148, 136, 0.3);
            transform: translateY(-5px);
        }

        .support-icon {
            font-size: 3rem;
            color: var(--primary);
            margin-bottom: 1.5rem;
            opacity: 0.9;
        }
        .support-card h4 {
            font-weight: 600;
            margin-bottom: 1rem;
        }
        .support-card p {
            color: var(--text-light);
            margin-bottom: 2rem;
            flex-grow: 1;
        }
        .btn-support {
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
        }
        .btn-chat {
            background: transparent;
            border: 2px solid #E5E7EB;
            color: var(--text);
        }
        .btn-chat:hover {
            background: #F3F4F6;
        }
        .btn-call {
            background: #F97316;
            color: white;
        }
        .btn-call:hover {
            background: #EA580C;
        }
        .btn-help {
            background: transparent;
            border: 2px solid #E5E7EB;
            color: var(--text);
        }
        .btn-help:hover {
            background: #F3F4F6;
        }

        .contact-box {
            background: white;
            border-radius: 1rem;
            padding: 2.5rem;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-top: 4rem;
        }
        .contact-box h4 {
            font-weight: 600;
            margin-bottom: 1rem;
        }
        .contact-box p {
            color: var(--text-light);
            margin-bottom: 2rem;
        }

        /* Updated Contact Support Team button */
        .btn-contact {
            background: var(--primary);
            color: white !important; /* Force white text */
            padding: 0.8rem 2rem;
            border-radius: 0.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-contact:hover {
            background: #0b7a6f;
            color: white !important; /* Ensure text stays white */
            box-shadow: 0 0 25px rgba(13, 148, 136, 0.6);
            text-decoration: none;
        }

        @media (max-width: 992px) {
            .support-title { font-size: 2.2rem; }
        }
        @media (max-width: 768px) {
            .support-section { padding: 4rem 0 3rem; }
            .support-title { font-size: 1.9rem; }
            .support-subtitle { margin-bottom: 3rem; }
            .support-card { min-height: auto; } /* Allow flexibility on mobile */
        }

        /* =========================
   NAVBAR BUTTON GLOW EFFECTS
   ========================= */

/* ---------- Signup / Login Button (Same Glow as Hero Button) ---------- */
.btn-started {
    transition: box-shadow 0.4s ease, transform 0.3s ease;
}

.btn-started:hover {
    box-shadow:
        0 0 12px rgba(13, 148, 136, 0.8),
        0 0 25px rgba(13, 148, 136, 0.6),
        0 0 40px rgba(13, 148, 136, 0.4);
    transform: translateY(-2px);
}
/* ---------- Booking Button (Green Glow on Hover Only) ---------- */
.btn-book {
    transition: box-shadow 0.4s ease, transform 0.3s ease, background 0.3s ease;
}

.btn-book:hover {
    background: white;
    box-shadow:
        0 0 10px rgba(13, 148, 136, 0.6),
        0 0 20px rgba(13, 148, 136, 0.4);
    transform: translateY(-2px);
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="logo.jpg" />
            SereneMind <span style="color:#9CA3AF;">THERAPY</span>
        </a>
            <div class="mx-auto">
    <ul class="navbar-nav d-flex flex-row">
        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="About.aspx">About</a></li>
        <li class="nav-item"><a class="nav-link" href="Services.aspx">Services</a></li>
        <li class="nav-item"><a class="nav-link" href="FAQs.aspx">FAQ</a></li>
        <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
    </ul>
</div>
<div class="d-none d-lg-flex align-items-center">
    <a href="Booking.aspx" class="btn btn-book"><i class="fa-solid fa-calendar"></i><span>Book Session</span></a>
    <a href="Login_Signup.aspx" class="btn btn-started"><i class="fa-solid fa-user"></i> <span>Account</span></a>
</div>
            </div>
        </nav>

        <section class="support-section">
            <div class="container">
                <h2 class="support-title">We are here to listen</h2>
                <p class="support-subtitle">Compassionate support to guide you on your journey to mental wellness</p>
                <div class="row justify-content-center">
                    <div class="col-md-4 mb-4">
                        <div class="support-card">
                            <div class="support-icon">
                                <i class="far fa-comments"></i>
                            </div>
                            <h4>Live Chat Support</h4>
                            <p>Chat anonymously with a trained mental health counselor for immediate advice</p>
                            <a href="#" class="btn btn-support btn-chat">Start Chat</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="support-card">
                            <div class="support-icon">
                                <i class="fas fa-headset"></i>
                            </div>
                            <h4>Crisis Consultation</h4>
                            <p>Speak directly with our intake team to match with the right therapist</p>
                            <a href="#" class="btn btn-support btn-call">Call Helpline</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="support-card">
                            <div class="support-icon">
                                <i class="far fa-heart"></i>
                            </div>
                            <h4>Wellness Resources</h4>
                            <p>Browse our library of articles on anxiety, depression, and self-care</p>
                            <a href="#" class="btn btn-support btn-help">Visit Library</a>
                        </div>
                    </div>
                </div>
                <div class="contact-box">
                    <h4>Not sure where to start?</h4>
                    <p>Contact our care coordinators for a personalized therapy assessment</p>
                    <a href="#" class="btn btn-contact">
                        <i class="far fa-envelope" style="margin-right:8px;"></i> Contact Care Team
                    </a>
                </div>
            </div>
        </section>
       
                         <div class="footer-note" style="
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    text-align:center;
">
    <br /><br />
    <img src="logo.jpg" width="38" style="border-radius:50%;" />
    <strong>www.serenemindtherapy.pk</strong><br />
    <span style="color:#FFD700;">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
    </span>
    <span>4.9/5 Rating</span>
</div>
            </div>
        </section>

        <footer class="footer" style="background: var(--primary); color: white; margin-top: 4rem;">
            <div class="footer-top" style="background: rgba(255,255,255,0.05); padding: 50px 20px; text-align: center; border-bottom: 1px solid rgba(255,255,255,0.1);">
                <div class="subscribe-box" style="display: inline-flex; margin-bottom: 20px; border-radius: 8px; overflow: hidden; box-shadow: 0 6px 20px rgba(0,0,0,0.15); flex-wrap:wrap; justify-content:center;">
                    <input type="email" placeholder="Enter your email for wellness tips" style="padding: 14px 18px; width: 340px; border: none; background: white; color: #333; font-size: 15px;" />
                    <button type="button" style="padding: 14px 32px; background: #0f766e; color: white; border: none; font-weight: bold; cursor: pointer;">
                        Subscribe
                    </button>
                </div>
                <div class="rating" style="font-size: 16px; font-weight: 500;">
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

            <div class="footer-main container" style="display: flex; justify-content: space-between; padding: 60px 0; flex-wrap: wrap; gap: 40px;">
                <div class="footer-col" style="flex: 1; min-width: 280px;">
                    <div class="logo-section" style="margin-bottom: 20px;">
                        <img src="logo.jpg" style="width: 40px; height: 40px; object-fit: contain; margin-right: 10px; vertical-align: middle; background:white; border-radius:50%;"/>
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
                    <h4 style="color: white; font-size: 17px; margin-bottom: 20px; position: relative;">
                        Quick Links
                        <span style="position: absolute; left: 0; bottom: -8px; width: 95px; height: 3px; background: #E6F4F1; border-radius: 2px;"></span>
                    </h4>
                    <ul style="list-style: none; padding: 0;">
                        <li style="margin-bottom: 12px;"><a href="Home.aspx" style="color: #E6F4F1; transition: 0.3s;">Home</a></li>
                        <li style="margin-bottom: 12px;"><a href="About.aspx" style="color: #E6F4F1; transition: 0.3s;">About</a></li>
                        <li style="margin-bottom: 12px;"><a href="Services.aspx" style="color: #E6F4F1; transition: 0.3s;">Services</a></li>
                        <li style="margin-bottom: 12px;"><a href="FAQs.aspx" style="color: #E6F4F1; transition: 0.3s;">FAQ</a></li>
                        <li style="margin-bottom: 12px;"><a href="Contact.aspx" style="color: #E6F4F1; transition: 0.3s;">Contact Us</a></li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4 style="color: white; font-size: 17px; margin-bottom: 20px; position: relative;">
                        Therapy Services
                        <span style="position: absolute; left: 0; bottom: -8px; width: 105px; height: 3px; background: #E6F4F1; border-radius: 2px;"></span>
                    </h4>
                    <ul style="list-style: none; padding: 0;">
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Individual Counseling</li>
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Couples Therapy</li>
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Anxiety & Depression</li>
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Trauma Recovery</li>
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Child Psychology</li>
                        <li style="margin-bottom: 12px; color: #E6F4F1;">Stress Management</li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4 style="color: white; font-size: 17px; margin-bottom: 20px; position: relative;">
                        Contact Clinic
                        <span style="position: absolute; left: 0; bottom: -8px; width: 105px; height: 3px; background: #E6F4F1; border-radius: 2px;"></span>
                    </h4>
                    <div style="margin-bottom: 15px; color: #E6F4F1;">
                        <i class="fas fa-envelope" style="margin-right: 12px; color: #E6F4F1;"></i> help@serenemind.pk
                    </div>
                    <div style="margin-bottom: 15px; color: #E6F4F1;">
                        <i class="fas fa-phone" style="margin-right: 12px; color: #E6F4F1;"></i> +92 300 1234567
                    </div>
                    <div style="margin-bottom: 15px; color: #E6F4F1;">
                        <i class="fas fa-location-dot" style="margin-right: 12px; color: #E6F4F1;"></i> Main Clifton Rd, Karachi
                    </div>
                    <div style="margin-bottom: 25px; color: #E6F4F1;">
                        <i class="fas fa-clock" style="margin-right: 12px; color: #E6F4F1;"></i> Mon-Sat: 9am - 9pm
                    </div>
                    <h5 style="color: white; margin: 20px 0 15px;">Follow Us</h5>
                    <div class="social-links">
                        <a href="#" style="display: inline-block; background: rgba(255,255,255,0.15); color: white; width: 40px; height: 40px; line-height: 40px; text-align: center; border-radius: 10px; margin-right: 10px; font-size: 16px; transition: 0.3s;">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" style="display: inline-block; background: rgba(255,255,255,0.15); color: white; width: 40px; height: 40px; line-height: 40px; text-align: center; border-radius: 10px; margin-right: 10px; font-size: 16px; transition: 0.3s;">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" style="display: inline-block; background: rgba(255,255,255,0.15); color: white; width: 40px; height: 40px; line-height: 40px; text-align: center; border-radius: 10px; margin-right: 10px; font-size: 16px; transition: 0.3s;">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="footer-bottom" style="background: rgba(0,0,0,0.2); padding: 25px 0; text-align: center; font-size: 14px;">
                <div class="container" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 15px; color: #E6F4F1;">
                    <div>© 2025 SereneMind Therapy. All rights reserved.</div>
                    <div>
                        <a href="PrivacyPolicy.aspx" style="color: #E6F4F1; margin: 0 12px;">Privacy Policy</a> |
                        <a href="MedicalDisclamier.aspx" style="color: #E6F4F1; margin: 0 12px;">Medical Disclaimer</a>
                    </div>
                    <div>Caring with <span style="color: #ff6b6b; font-size: 16px;"><i class="fas fa-heart"></i></span></div>
                </div>
            </div>
        </footer>

    </form>
</body>
</html>