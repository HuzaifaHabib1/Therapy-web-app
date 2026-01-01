<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="Therapy_web_app.FAQs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SereneMind Therapy – Restore Your Peace</title>
    <link rel="icon" type="image/jpg" href="logo.jpg" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: white;
            color: var(--text);
        }
        a { text-decoration: none; }

        /* Navbar - Adjusted padding */
        .navbar {
            background: white !important;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary) !important;
        }
        .navbar-brand img {
            width: 40px;
            height: 40px;
            object-fit: contain;
            margin-right: 10px;
        }
        .navbar-nav .nav-link {
            color: #374151 !important;
            font-weight: 500;
            margin: 0 1rem;
        }
        .navbar-nav .nav-link:hover {
            color: var(--primary) !important;
        }
        .btn-book {
            padding: 0.5rem 1rem;
            border: 1px solid #D1D5DB;
            border-radius: 0.375rem;
            color: #374151;
            margin-right: 0.75rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-book:hover {
            background: #F3F4F6;
            box-shadow: 0 0 10px rgba(13, 148, 136, 0.6), 0 0 20px rgba(13, 148, 136, 0.4);
            transform: translateY(-2px);
        }
        .btn-started {
            background: var(--primary);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            font-weight: 600;
            transition: all 0.4s ease;
        }
        .btn-started:hover {
            background: #0b7a6f;
            box-shadow: 0 0 12px rgba(13, 148, 136, 0.8), 0 0 25px rgba(13, 148, 136, 0.6);
            transform: translateY(-2px);
            color: white;
        }

        /* --- FIX: Container and Page Content --- */
        
        /* Reset container to fix Navbar alignment */
        .container {
            max-width: 1200px; /* Increased from 1000px to standard size */
            margin: 0 auto;    /* Removed the 60px margin that broke the navbar */
            padding: 0 15px;
        }

        /* New class for the body content spacing */
        .page-content {
            margin-top: 60px;
            margin-bottom: 60px;
        }

        /* Header */
        .header {
            text-align: center;
            padding: 20px 0 40px;
        }
        .header h1 {
            margin-bottom: 10px;
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text);
        }
        .header p {
            font-size: 1.1rem;
            color: var(--text-light);
        }
        .badge {
            display: inline-block;
            background: var(--primary-light);
            color: var(--primary);
            padding: 8px 20px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 16px;
        }

        /* FAQ Section */
        .faq-section {
            display: flex;
            flex-direction: column;
            gap: 12px;
            max-width: 900px; /* Constrain FAQ width for better readability */
            margin: 0 auto;
        }
        .faq-item {
            background: #FFFFFF;
            border-radius: 10px;
            border: 1px solid #E5E7EB;
            overflow: hidden;
        }
        .faq-question {
            padding: 18px 22px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
            font-size: 1.05rem;
            transition: background-color 0.3s;
        }
        .faq-question:hover {
            background-color: #F9FAFB;
        }
        .faq-question i {
            font-size: 1.2rem;
            color: #666;
            transition: transform 0.3s;
        }
        .faq-question.active i {
            transform: rotate(180deg);
        }
        .faq-answer {
            max-height: 0;
            overflow: hidden;
            background-color: #FBFCFD;
            padding: 0 22px;
            transition: all 0.4s ease;
        }
        .faq-answer.open {
            max-height: 500px;
            padding: 18px 22px 22px;
            border-top: 1px solid #eee;
        }
        .faq-answer p {
            margin: 0;
            color: #555;
            line-height: 1.6;
        }

        /* Support Section */
        .support-section {
            margin-top: 80px;
            text-align: center;
        }
        .support-section h3 {
            font-size: 1.9rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--text);
        }
        .support-section > p {
            color: var(--text-light);
            margin-bottom: 40px;
        }
        .support-cards {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }
        .card {
            width: 260px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.06);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: translateY(-8px);
        }
        .card i {
            font-size: 2.4rem;
            color: var(--primary);
            margin-bottom: 12px;
        }
        .card button {
            background: var(--primary);
            border: none;
            padding: 10px 18px;
            border-radius: 6px;
            color: white;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s;
        }
        .card button:hover {
            background: #0b7a6f;
        }
        .contact-btn {
            background: var(--primary);
            padding: 14px 32px;
            font-size: 1.1rem;
            border-radius: 8px;
            border: none;
            color: white;
            margin-top: 20px;
            transition: all 0.3s;
        }
        .contact-btn:hover {
            background: #0b7a6f;
            transform: translateY(-2px);
        }

        /* =========================
           RESPONSIVE MEDIA QUERIES
           ========================= */

        /* Large tablets & small laptops (≤ 992px) */
        @media (max-width: 992px) {
            .header h1 {
                font-size: 2.2rem;
            }
            .header p {
                font-size: 1rem;
            }
            .support-section h3 {
                font-size: 1.7rem;
            }
            .card {
                width: 240px;
                padding: 20px;
            }
            .footer-main.container {
                justify-content: center;
            }
            .footer-col {
                flex: 1 1 45%;
                min-width: 280px;
            }
        }

        /* Tablets & large phones (≤ 768px) */
        @media (max-width: 768px) {
            .navbar {
                padding: 0.8rem 0;
            }
            .navbar-brand {
                font-size: 1.3rem;
            }
            /* Reset container margin for mobile too */
            .container {
                margin: 0 auto; 
                padding: 0 20px;
            }
            /* Add spacing via page-content instead */
            .page-content {
                margin-top: 40px;
            }
            .header {
                padding: 10px 0 30px;
            }
            .header h1 {
                font-size: 2rem;
            }
            .header p {
                font-size: 0.95rem;
            }
            .badge {
                font-size: 13px;
                padding: 6px 16px;
            }
            .faq-question {
                font-size: 1rem;
                padding: 16px 18px;
            }
            .faq-answer.open {
                padding: 16px 18px 20px;
            }
            .support-section {
                margin-top: 60px;
            }
            .support-section > p {
                margin-bottom: 30px;
            }
            .support-cards {
                gap: 20px;
            }
            .card {
                width: 100%;
                max-width: 300px;
            }
            .contact-btn {
                padding: 12px 28px;
                font-size: 1rem;
            }
            .footer-top {
                padding: 40px 15px;
            }
            .subscribe-box input {
                width: 280px !important;
            }
        }

        /* Mobile devices (≤ 576px) */
        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            .navbar-brand img {
                width: 32px;
                height: 32px;
            }
            .container {
                margin: 0 auto;
                padding: 0 15px;
            }
            .page-content {
                margin-top: 30px;
            }
            .header h1 {
                font-size: 1.8rem;
            }
            .header p {
                font-size: 0.9rem;
            }
            .faq-question {
                font-size: 0.95rem;
                padding: 14px 16px;
            }
            .faq-question i {
                font-size: 1.1rem;
            }
            .faq-answer p {
                font-size: 0.9rem;
            }
            .support-section h3 {
                font-size: 1.5rem;
            }
            .card {
                padding: 20px;
            }
            .card i {
                font-size: 2rem;
            }
            .card h4 {
                font-size: 1.1rem;
            }
            .card p {
                font-size: 0.9rem;
            }
            .footer-col {
                flex: 1 1 100%;
                text-align: center;
            }
            .footer-main.container {
                padding: 40px 0;
                gap: 30px;
            }
            .footer-top {
                padding: 30px 10px;
            }
            .subscribe-box {
                display: flex !important;
                flex-direction: column;
                width: 100%;
                max-width: 300px;
                margin: 0 auto 20px;
            }
            .subscribe-box input {
                width: 100% !important;
                border-radius: 8px 8px 0 0 !important;
            }
            .subscribe-box button {
                border-radius: 0 0 8px 8px !important;
                width: 100%;
            }
            .footer-bottom .container {
                flex-direction: column;
                gap: 10px;
                font-size: 13px;
            }
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="logo.jpg" />
                    SereneMind <span style="color:#9CA3AF;">THERAPY</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <div class="mx-auto">
                        <ul class="navbar-nav d-flex flex-row justify-content-center">
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
            </div>
        </nav>

        <div class="container page-content">
           <div class="header">
               <div class="badge">FAQs</div>
               <h1>Frequently Asked Questions</h1>
               <p>Answers to your questions about therapy, mental wellness, and our process</p>
           </div>

           <div class="faq-section">
               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       What qualifications do your therapists have?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Our team consists of licensed clinical psychologists and certified therapists. All professionals hold advanced degrees (MS/PhD) and are registered with the Pakistan Medical Commission (PMC) or relevant international bodies, ensuring high standards of care.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       What happens during the first session?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>The first session is an intake assessment. Your therapist will discuss your history, current challenges, and goals for therapy. It’s a safe space to ask questions and see if you feel comfortable with the therapist's approach.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       Is my information kept confidential?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Absolutely. Confidentiality is the cornerstone of therapy. We strictly adhere to ethical guidelines, and your personal information or session details are never shared with anyone without your written consent, except in cases of immediate harm.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       Do you offer sessions in Urdu?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Yes! We conduct sessions in both English and Urdu (as well as other regional languages upon request) to ensure you can express your emotions and thoughts freely in the language most comfortable for you.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       How do online therapy sessions work?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Online therapy is conducted via secure, HIPAA-compliant video platforms (like Zoom or Google Meet). You just need a stable internet connection and a device with a camera/mic. We'll send you a private link before your scheduled time.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       How much does a session cost?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Our pricing is transparent and varies based on the therapist's experience level. We offer individual sessions, package bundles, and sliding-scale fees for students or those with financial constraints. Please check our 'Services' page for detailed rates.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       Can I switch therapists if I don't feel a connection?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Yes, the therapeutic relationship is vital for success. If you feel you aren't connecting with your therapist after a few sessions, let our admin team know. We will happily match you with another professional better suited to your needs.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       What types of issues do you treat?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>We specialize in treating anxiety, depression, trauma (PTSD), stress management, relationship issues, and self-esteem struggles. We also offer specialized career counseling and child psychology services.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       Are you an emergency service?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>No, we are not a crisis center. If you are experiencing a life-threatening emergency or having thoughts of self-harm, please go to the nearest hospital emergency room immediately or call a suicide prevention helpline.</p>
                   </div>
               </div>

               <div class="faq-item">
                   <div class="faq-question" onclick="toggleAnswer(this)">
                       Do you offer couples or family therapy?
                       <i class="fas fa-chevron-down"></i>
                   </div>
                   <div class="faq-answer">
                       <p>Yes, we offer specialized sessions for couples looking to improve communication and resolve conflict, as well as family therapy sessions to address household dynamics and support collective healing.</p>
                   </div>
               </div>
           </div>
        </div>

       
        <div class="footer-note" style="display:flex; flex-direction:column; align-items:center; justify-content:center; text-align:center;">
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

    <script>
        function toggleAnswer(element) {
            // Toggle active class on the question to rotate arrow
            element.classList.toggle('active');

            // Find the answer div (next sibling)
            var answer = element.nextElementSibling;

            // Toggle the open class to slide down/up
            answer.classList.toggle('open');
        }
    </script>
</body>
</html>