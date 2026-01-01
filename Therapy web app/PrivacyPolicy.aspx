<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrivacyPolicy.aspx.cs" Inherits="Therapy_web_app.PrivacyPolicy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Privacy Policy - Serene Mind</title>
    <style>
        /* General Reset */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9fb;
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.6;
        }

        /* Container for the document paper effect */
        .policy-container {
            max-width: 800px;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 50px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border-radius: 8px;
            border: 1px solid #e1e1e1;
        }

        /* Header Styling */
        .policy-header {
            text-align: center;
            margin-bottom: 40px;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 20px;
        }

        .policy-header h1 {
            color: #2c3e50;
            margin-bottom: 10px;
            font-size: 2.2rem;
        }

        .effective-date {
            color: #7f8c8d;
            font-style: italic;
            font-size: 0.95rem;
        }

        /* Section Styling */
        .policy-section {
            margin-bottom: 30px;
        }

        h2 {
            color: #2980b9;
            font-size: 1.4rem;
            margin-bottom: 15px;
            border-left: 4px solid #2980b9;
            padding-left: 10px;
        }

        p {
            margin-bottom: 15px;
            color: #555;
        }

        /* List Styling */
        ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
            color: #555;
        }

        li {
            margin-bottom: 8px;
        }

        strong {
            color: #333;
        }

        /* Contact Box Styling */
        .contact-box {
            background-color: #f0f8ff;
            border: 1px solid #bde0fe;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
        }

        .contact-box p {
            margin: 5px 0;
        }

        /* Responsive Design for Mobile */
        @media (max-width: 600px) {
            .policy-container {
                margin: 0;
                padding: 20px;
                border-radius: 0;
                box-shadow: none;
            }
            
            .policy-header h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="policy-container">
            
            <div class="policy-header">
                <h1>Privacy Policy</h1>
                <p class="effective-date">Effective Date: December 18, 2025</p>
            </div>

            <div class="policy-section">
                <p>
                    At <strong>Serene Mind</strong>, we are committed to protecting your privacy and ensuring the confidentiality of your personal and health information. This Privacy Policy explains how we collect, use, and safeguard your data when you visit our website and use our consultation services.
                </p>
            </div>

            <div class="policy-section">
                <h2>1. Information We Collect</h2>
                <p>We collect information to provide you with the best possible care and experience:</p>
                <ul>
                    <li><strong>Personal Identification:</strong> Name, email address, phone number, and date of birth.</li>
                    <li><strong>Health Information:</strong> Brief intake notes, reason for seeking therapy, and session history (collected via secure, encrypted forms).</li>
                    <li><strong>Payment Data:</strong> Billing address and credit card information (processed through secure third-party providers like Stripe or PayPal).</li>
                    <li><strong>Technical Data:</strong> IP address, browser type, and cookies to improve website functionality.</li>
                </ul>
            </div>

            <div class="policy-section">
                <h2>2. How We Use Your Information</h2>
                <p>Your data is used strictly for professional purposes, including:</p>
                <ul>
                    <li>Scheduling and managing therapy consultations.</li>
                    <li>Processing payments for sessions.</li>
                    <li>Communicating regarding appointments or technical support.</li>
                    <li>Improving our website and user experience.</li>
                </ul>
            </div>

            <div class="policy-section">
                <h2>3. Confidentiality and Disclosure</h2>
                <p>We do not sell, rent, or trade your personal information. Your health records are protected by law. We only disclose information when:</p>
                <ul>
                    <li><strong>Consent:</strong> You provide written authorization to share records with another provider.</li>
                    <li><strong>Safety:</strong> There is a clear risk of harm to yourself or others.</li>
                    <li><strong>Legal Requirements:</strong> We are served with a valid court order or subpoena.</li>
                </ul>
            </div>

            <div class="policy-section">
                <h2>4. Data Security</h2>
                <p>We implement industry-standard security measures to protect your sensitive data:</p>
                <ul>
                    <li><strong>Encryption:</strong> All data transmitted through our site uses Secure Socket Layer (SSL) technology.</li>
                    <li><strong>Secure Storage:</strong> Personal health information is stored on HIPAA-compliant servers.</li>
                    <li><strong>Access Control:</strong> Only authorized staff involved in your care have access to your information.</li>
                </ul>
            </div>

            <div class="policy-section">
                <h2>5. Your Rights</h2>
                <p>Depending on your location, you may have the right to:</p>
                <ul>
                    <li>Request a copy of your personal data.</li>
                    <li>Request corrections to inaccurate information.</li>
                    <li>Request the deletion of your data (subject to legal record-keeping requirements).</li>
                    <li>Withdraw consent for data processing at any time.</li>
                </ul>
            </div>

            <div class="policy-section">
                <h2>6. Third-Party Services</h2>
                <p>We may use third-party tools for video conferencing (e.g., Zoom for Healthcare) or billing. These partners are vetted to ensure they meet the same high standards of privacy and security as our practice.</p>
            </div>

            <div class="policy-section">
                <h2>7. Changes to This Policy</h2>
                <p>We may update this policy periodically. We will notify you of any significant changes by posting the new policy on this page with a revised "Effective Date."</p>
            </div>

            <div class="policy-section">
                <h2>8. Contact Us</h2>
                <p>If you have questions about this Privacy Policy or how your data is handled, please contact us at:</p>
                <div class="contact-box">
                    <p><strong>Serene Mind</strong></p>
                    <p>📧 Email: <a href="mailto:help@serenemind.pk">help@serenemind.pk</a></p>
                    <p>📍 Address: Main Clifton Rd, Karachi</p>
                </div>
            </div>

        </div>
    </form>
</body>
</html>