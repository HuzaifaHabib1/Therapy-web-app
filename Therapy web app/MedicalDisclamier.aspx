<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalDisclamier.aspx.cs" Inherits="Therapy_web_app.MedicalDisclamier" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Disclaimer - Serene Mind</title>
    <style>
        /* General Reset (Matches Privacy Policy) */
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

        /* Special Styling for Emergency Section */
        .warning-box {
            background-color: #fff5f5; /* Light red background */
            border: 1px solid #ffcccc;
            border-left: 5px solid #e74c3c; /* Strong red left border */
            padding: 20px;
            border-radius: 4px;
        }

        .warning-box h2 {
            border-left: none;
            padding-left: 0;
            color: #c0392b;
            margin-top: 0;
        }

        /* Responsive Design */
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
                <h1>Medical Disclaimer</h1>
                <p class="effective-date">Last Updated: December 18, 2025</p>
            </div>

            <div class="policy-section">
                <h2>1. No Medical Advice</h2>
                <p>
                    The information provided on <strong>Serene Mind</strong>, including but not limited to text, graphics, images, and other material, is for informational and educational purposes only. No material on this site is intended to be a substitute for professional medical advice, diagnosis, or treatment.
                </p>
            </div>

            <div class="policy-section">
                <h2>2. Seek Professional Counsel</h2>
                <p>
                    Always seek the advice of your physician or another qualified healthcare provider with any questions you may have regarding a medical condition or treatment. Never disregard professional medical advice or delay in seeking it because of something you have read on this website.
                </p>
            </div>

            <div class="policy-section">
                <h2>3. No Provider-Patient Relationship</h2>
                <p>
                    Your use of this website does not create a doctor-patient (or healthcare provider-patient) relationship between you and <strong>Serene Mind</strong>.
                </p>
            </div>

            <div class="policy-section warning-box">
                <h2>4. Emergency Situations</h2>
                <p>
                    If you think you may have a medical emergency, call your doctor, go to the nearest hospital emergency department, or call emergency services (e.g., 911 or your local emergency number) immediately. 
                </p>
                <p>
                    <strong>Serene Mind</strong> does not recommend or endorse any specific tests, physicians, products, procedures, or opinions.
                </p>
            </div>

            <div class="policy-section">
                <h2>5. Accuracy and Liability</h2>
                <p>
                    While we strive to provide accurate information, medical knowledge is constantly evolving. <strong>Serene Mind</strong> makes no representation and assumes no responsibility for the accuracy of information contained on or available through this website, and such information is subject to change without notice. Relying on any information provided by this website is solely at your own risk.
                </p>
            </div>

        </div>
    </form>
</body>
</html>
