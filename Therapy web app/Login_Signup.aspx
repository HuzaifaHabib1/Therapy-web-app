<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Signup.aspx.cs" Inherits="TherapyWebApp.Login_Signup" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login / Signup</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <style>
        /* Define the color theme variables from Code 1 */
        :root {
            --primary: #0D9488;
            --primary-light: #E6F4F1;
            --text: #1F2937;
            --text-light: #6B7280;
            --bg: #F9FAFB;
        }

        /* Applying the general body/html styles from Code 1 */
        body, html {
            margin: 0; padding: 0; 
            font-family: 'Inter', sans-serif; /* Assuming Inter is used, though not linked here, it's a good practice */
            background: var(--bg); /* Using the background color from Code 1 */
            color: var(--text); /* Using the text color from Code 1 */
        }

        /* Adjusting the main container for the new theme */
        .account-container {
            max-width: 420px; 
            margin: 100px auto;
            padding: 40px;
            /* Changed background from dark opaque to a white/light card style */
            background: white; 
            border-radius: 12px;
            /* Adjusted shadow for a modern, lighter look */
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); 
            text-align: center;
        }

        /* Keeping ASP inputs clean */
        .asp-input {
            width: 90%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #D1D5DB; /* Added a light border for contrast on a white background */
            box-sizing: border-box;
            color: var(--text); /* Using text color variable */
            background: var(--primary-light); /* Light background for input field */
        }
        .asp-input:focus {
             border-color: var(--primary);
             outline: none;
             box-shadow: 0 0 0 2px var(--primary-light);
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 90%;
            margin: 0 auto; 
            margin-top: 25px; /* Increased margin for spacing */
            margin-bottom: 20px;
        }

        /* Primary Button (Login/Signup - .btn-started) */
        .btn-started {
            width: 48%;
            padding: 12px;
            background: var(--primary); /* Primary color */
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-weight: 600; /* Increased weight for emphasis */
            transition: background 0.3s, box-shadow 0.3s, transform 0.3s;
        }
        .btn-started:hover {
            background: #0b7a6f; /* Slightly darker primary on hover, similar to Code 1 */
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(13, 148, 136, 0.4);
        }

        /* Secondary Button (Toggle - .btn-book) */
        .btn-book {
            width: 48%; 
            padding: 12px;
            color: var(--primary); /* Primary color for text */
            background: white; 
            border: 2px solid var(--primary); /* Primary color for border */
            border-radius: 50px;
            cursor: pointer;
            font-weight: 600; /* Increased weight for emphasis */
            transition: all 0.3s;
        }
        .btn-book:hover {
            background: var(--primary-light); /* Light primary background on hover, similar to Code 1 */
            border-color: var(--primary);
            transform: translateY(-2px);
        }

        /* Error Message (RequiredFieldValidator/lblMsg) - Using a standard warning color */
        .account-container span[style*="Yellow"], #lblMsg {
            color: #EF4444 !important; /* Changed from bright yellow to a more subtle red/error color (similar to a tailwind red-500) */
            font-weight: 500;
            display: block;
            margin-top: -10px;
            margin-bottom: 10px;
            text-align: left;
            padding-left: 5%;
        }
        /* Style for the h2 element */
        .account-container h2 {
            color: var(--text); /* Ensure the heading uses the text color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="account-container">
            <h2 style="margin-bottom: 30px;">
                <asp:Literal ID="litMode" runat="server" Text="User Login" />
            </h2>

            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address" CssClass="asp-input" />
            <asp:RequiredFieldValidator 
                ID="rfvEmail" 
                ControlToValidate="txtEmail" 
                Text="Email is required." 
                ForeColor="Yellow" 
                runat="server" />
            

            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="asp-input" />
            <asp:RequiredFieldValidator 
                ID="rfvPassword" 
                ControlToValidate="txtPassword" 
                Text="Password is required." 
                ForeColor="Yellow" 
                runat="server" />
            <br />
            
            <div class="button-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-started" />
                <asp:Button ID="btnToggle" runat="server" Text="Switch to Register" OnClick="btnToggle_Click" CssClass="btn-book" CausesValidation="False" />
            </div>

            <asp:Label ID="lblMsg" runat="server" ForeColor="Yellow" Font-Bold="True" style="margin-top: 15px;" />
        </div>
    </form>
</body>
</html>