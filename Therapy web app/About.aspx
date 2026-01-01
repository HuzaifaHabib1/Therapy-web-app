<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Therapy_web_app.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SereneMind Therapy – Restore Your Peace</title><link rel="icon" type="image/png" href="logo.jpg" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" />
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
        .container { max-width: 1200px; margin: 0 auto; padding: 0 20px; }

        .navbar { background: white !important; box-shadow: 0 1px 3px rgba(0,0,0,0.1); padding: 1rem 0; }
        .navbar-brand { font-weight: 700; font-size: 1.5rem; color: var(--primary) !important; }
        .navbar-brand img { width: 40px; height: 40px; object-fit: contain; margin-right: 10px; }
        .navbar-nav .nav-link { color: #374151 !important; font-weight: 500; margin: 0 1rem; }
        .navbar-nav .nav-link:hover { color: var(--primary) !important; }
         
        .btn-book { padding: 0.5rem 1rem; border: 1px solid #D1D5DB; border-radius: 0.375rem; color: #374151; margin-right: 0.75rem; font-weight: 600; }
        .btn-book:hover { background: #F3F4F6; box-shadow: 0 0 10px rgba(13, 148, 136, 0.6), 0 0 20px rgba(13, 148, 136, 0.4); transform: translateY(-2px); }
        
        .btn-started { background: var(--primary); color: white; padding: 0.5rem 1rem; border-radius: 0.375rem; font-weight: 600; transition: box-shadow 0.4s ease, transform 0.3s ease; }
        .btn-started:hover { background: #0b7a6f; color: white; box-shadow: 0 0 12px rgba(13, 148, 136, 0.8), 0 0 25px rgba(13, 148, 136, 0.6), 0 0 40px rgba(13, 148, 136, 0.4); transform: translateY(-2px); }

        .hero { background: #F9FAFB; padding: 4rem 0; }
        .hero h1 { font-size: 2.5rem; margin-bottom: 1rem; text-align: center; color: var(--text); }
        .hero > .container > p { text-align: center; color: var(--text-light); max-width: 700px; margin: 0 auto 1rem; }

        .empowering-section { margin-top: 4rem; }
        .empowering-section h2 { font-size: 2rem; text-align: left; margin-bottom: 2rem; color: var(--text); }
        .about-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; align-items: start; }
        .about-text p { font-size: 1.1rem; line-height: 1.8; color: var(--text-light); }
        .location-note { margin-top: 2rem; color: var(--primary); font-size: 1.1rem; }

        .stats-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; margin-top: 1rem; }
        .stat-card { background: white; padding: 1.5rem; border-radius: 0.75rem; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; }
        .stat-card i { font-size: 2.2rem; color: var(--primary); margin-bottom: 0.75rem; }
        .stat-card .num { font-size: 2rem; font-weight: 700; color: var(--primary); margin: 0.5rem 0; }
        .stat-card .label { color: var(--text-light); font-size: 0.95rem; }

        .values { background: #F9FAFB; padding: 5rem 0; }
        .values h2 { text-align: center; font-size: 2rem; margin-bottom: 1rem; }
        .values > .container > p { text-align: center; color: var(--text-light); margin-bottom: 3rem; }
        .values-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 2rem; }
        .value-card { background: white; padding: 2rem; border-radius: 0.5rem; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .value-card i { font-size: 3rem; color: var(--primary); margin-bottom: 1rem; }

        .cert-achieve { padding: 5rem 0; display: grid; grid-template-columns: 1fr 1fr; gap: 4rem; }
        .cert-list, .achieve-list { background: white; padding: 2rem; border-radius: 0.5rem; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .cert-item, .achieve-item { display: flex; align-items: center; margin-bottom: 1rem; color: var(--text-light); }
        .cert-item i, .achieve-item i { color: var(--primary); margin-right: 1rem; font-size: 1.2rem; }
        

        .mission { text-align: center; padding: 6rem 0; background: var(--primary-light); }
        .mission-icon { width: 90px; height: 90px; background: var(--primary); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 2rem; font-size: 2.5rem; }
        .mission blockquote { font-size: 1.6rem; font-weight: 500; max-width: 900px; margin: 0 auto 3rem; line-height: 1.7; color: var(--text); }

        /* ===============================
   GREEN GLOW + FLOAT ANIMATION
================================ */

@keyframes floatUpDown {
    0% { transform: translateY(0); }
    50% { transform: translateY(-8px); }
    100% { transform: translateY(0); }
}

/* ---------- VALUE & STAT CARDS ---------- */
.value-card,
.stat-card {
    transition: all 0.35s ease;
    position: relative;
}

.value-card:hover,
.stat-card:hover {
    transform: translateY(-10px);
    box-shadow:
        0 0 12px rgba(13,148,136,0.4),
        0 0 25px rgba(13,148,136,0.35),
        0 0 40px rgba(13,148,136,0.25);
    animation: floatUpDown 2.5s ease-in-out infinite;
}

/* ---------- FREE CONSULTATION BUTTON ---------- */
.btn-consult {
    background: var(--primary) !important;
    color: #fff !important;
    border: none;
    border-radius: 8px;
    transition: all 0.35s ease;
}

.btn-consult:hover {
    transform: translateY(-6px);
    box-shadow:
        0 0 12px rgba(13,148,136,0.5),
        0 0 30px rgba(13,148,136,0.4);
    animation: floatUpDown 2.5s ease-in-out infinite;
}

/* ---------- MISSION BUTTONS ---------- */
.btn-theme-one,
.btn-theme-two {
    background: var(--primary);
    color: white;
    padding: 0.7rem 1.6rem;
    border-radius: 8px;
    border: none;
    font-weight: 600;
    transition: all 0.35s ease;
}

.btn-theme-two {
    background: white;
    color: var(--primary);
    border: 2px solid var(--primary);
}

.btn-theme-one:hover,
.btn-theme-two:hover {
    transform: translateY(-6px);
    box-shadow:
        0 0 12px rgba(13,148,136,0.45),
        0 0 30px rgba(13,148,136,0.35);
    animation: floatUpDown 2.5s ease-in-out infinite;
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



        <section class="hero">

            <div class="container">

                <h1>Your Partner in Mental Wellness</h1>

                <p style="text-align:center; max-width:700px; margin:0 auto 4rem;">

                    Founded with a mission to provide compassionate, accessible, and evidence-based psychological support for everyone.

                </p>



                <div class="empowering-section">

                    <h2>Healing Minds, Transforming Lives</h2>



                    <div class="about-grid">

                        <div class="about-text">

                            <p>

                                SereneMind Therapy was born from a simple belief: mental health is as vital as physical health, and every individual deserves access to quality psychological care without judgment or barriers.

                            </p>

                            <p style="margin-top:1.5rem;">

                                As licensed clinical professionals, our founders recognized the gap in accessible mental healthcare. That's why SereneMind was created – to bridge that gap with personalized therapy, Cognitive Behavioral Therapy (CBT), and holistic wellness strategies.

                            </p>



                            <div class="location-note">

                                <i class="fas fa-laptop-medical"></i>

                                <strong> Compassionate Care, Accessible Everywhere</strong><br />

                                We offer both in-person sessions and secure telehealth options, ensuring you receive the support you need, wherever you are.

                            </div>

                        </div>



                        <div>

                            <div class="stats-grid">

                                <div class="stat-card">

                                    <i class="fa-solid fa-brain"></i>

                                    <div class="num">1k+</div>

                                    <div class="label">Sessions Conducted</div>

                                </div>

                                <div class="stat-card">

                                    <i class="fas fa-user-doctor"></i>

                                    <div class="num">10+</div>

                                    <div class="label">Years of Practice</div>

                                </div>

                                <div class="stat-card">

                                    <i class="fas fa-star"></i>

                                    <div class="num">99%</div>

                                    <div class="label">Client Satisfaction</div>

                                </div>

                                <div class="stat-card">

                                    <i class="fas fa-shield-heart"></i>

                                    <div class="num">100%</div>

                                    <div class="label">Confidentiality</div>

                                </div>

                            </div>

                        </div>



                        <div style="margin-top: 2rem;">

                            <button id="btnFreeConsultation" class="btn btn-primary btn-consult" href="Booking.aspx" style="padding: 0.75rem 1.5rem; font-size: 1.1rem; font-weight: 600;">Schedule a Consultation</button>

</div>

                    </div>

                </div>

            </div>

        </section>



        <section class="values">

            <div class="container">

                <h2>Our Therapeutic Approach</h2>

                <p>The principles that guide our practice and your healing journey</p>

                <div class="values-grid">

                    <div class="value-card">

                        <i class="fas fa-hands-holding-circle"></i>

                        <h3>Client-Centered Care</h3>

                        <p>You are unique. We tailor our therapeutic approach to meet your individual emotional needs and life goals.</p>

                    </div>

                    <div class="value-card">

                        <i class="fas fa-clipboard-check"></i>

                        <h3>Evidence-Based</h3>

                        <p>We utilize scientifically proven methods like CBT, DBT, and Mindfulness to ensure effective and lasting recovery.</p>

                    </div>

                    <div class="value-card">

                        <i class="fas fa-user-shield"></i>

                        <h3>Safe Space</h3>

                        <p>We provide a non-judgmental, confidential environment where you can feel safe to explore your thoughts.</p>

                    </div>

                    <div class="value-card">

                        <i class="fas fa-spa"></i>

                        <h3>Holistic Healing</h3>

                        <p>We focus on the whole person – integrating mental, emotional, and physical wellbeing for total health.</p>

                    </div>

                </div>

            </div>

        </section>



        <section class="cert-achieve container">

            <div class="cert-list">

                <h3><i class="fas fa-certificate" style="color:var(--primary);"></i> Clinical Credentials</h3>

                <p>Our qualifications and professional licensures</p>

                <div class="cert-item"><i class="fas fa-check"></i> Licensed Clinical Psychologists (PMDC)</div>

                <div class="cert-item"><i class="fas fa-check"></i> Certified CBT Practitioners</div>

                <div class="cert-item"><i class="fas fa-check"></i> Trauma-Informed Care Certified</div>

                <div class="cert-item"><i class="fas fa-check"></i> Family & Couples Therapy Specialization</div>

                <div class="cert-item"><i class="fas fa-check"></i> HIPAA Compliant Telehealth Providers</div>

            </div>

            <div class="achieve-list">

                <h3><i class="fas fa-trophy" style="color:var(--primary);"></i> Impact & Recognition</h3>

                <p>Milestones in our journey of healing minds</p>

                <div class="achieve-item"><i class="fas fa-check"></i> Over 1,000 individuals guided towards mental clarity</div>

                <div class="achieve-item"><i class="fas fa-check"></i> High recovery rate for Anxiety & Depression clients</div>

                <div class="achieve-item"><i class="fas fa-check"></i> Recognized for "Excellence in Mental Healthcare"</div>

                <div class="achieve-item"><i class="fas fa-check"></i> Successfully facilitated 200+ group therapy sessions</div>

                <div class="achieve-item"><i class="fas fa-check"></i> 5-Star rated for compassionate counseling</div>

            </div>

        </section>



        <section class="mission">

            <div class="mission-icon">

                <i class="fas fa-heart-pulse"></i>

            </div>

            <h2>Our Mission</h2>

            <blockquote>

                "To democratize access to quality mental healthcare, breaking the stigma surrounding therapy, and empowering individuals to reclaim their lives through empathy, understanding, and professional support."

            </blockquote>

            <div style="margin-top:2rem;">

                <asp:Button ID="Button1" runat="server" Text="Start Your Healing" CssClass="btn btn-theme-one" />

<asp:Button ID="Button2" runat="server" Text="Our Therapy Services" CssClass="btn btn-theme-two" Style="margin-left:1rem;" />



            </div>

        </section>



                 <div class="footer-note" style="justify-content:center; text-align:center"   >

                    <br /><br /> <img src="logo.jpg" width="38" style="border-radius:50%;" />

                    www.serenemindtherapy.pk &nbsp;&nbsp;<br />

                    <span style="color:#FFD700;"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span> 4.9/5 Rating

                </div>

            

      



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