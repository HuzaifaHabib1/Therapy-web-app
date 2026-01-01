<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="TherapyWebApp.Booking" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book Therapy Session</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding-top: 50px; background: #f4f6f9; }
        .booking-card {
            max-width: 700px;
            margin: 0 auto;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            background: white;
            padding: 30px;
        }
        .card-header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        h2 { color: #00796b; margin: 0; font-weight: 300; }
        .asp-form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
        .btn-started {
            background-color: #00796b;
            border-color: #00796b;
            color: white;
            padding: 12px;
            border-radius: 0.25rem;
            width: 100%;
            font-weight: bold;
            cursor: pointer;
        }
        .payment-info {
            background-color: #e3f2fd;
            border-left: 5px solid #2196f3;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .price-tag {
            font-size: 1.1rem;
            color: #d32f2f;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="booking-card">
                <div class="card-header-flex">
                    <h2>Schedule Session</h2>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-sm btn-danger" CausesValidation="False" />
                </div>

                <div class="form-group">
                    <label>Therapy Type</label>
                    <asp:DropDownList ID="ddlTherapy" runat="server" CssClass="asp-form-control" 
                        AutoPostBack="true" OnSelectedIndexChanged="ddlTherapy_SelectedIndexChanged" />
                    <div>Price: <span class="price-tag">PKR <asp:Label ID="lblPrice" runat="server" Text="0.00" /></span></div>
                </div>

                <div class="form-group">
                    <label>Select Therapist</label>
                    <asp:DropDownList ID="ddlTherapist" runat="server" CssClass="asp-form-control" />
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label>Session Date</label>
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="asp-form-control" />
                        <asp:RequiredFieldValidator ID="rfvDate" ControlToValidate="txtDate" Text="Required" ForeColor="Red" runat="server" Display="Dynamic" />
                    </div>

                    <div class="form-group col-md-6">
                        <label>Session Time (1.5 Hours)</label>
                        <asp:DropDownList ID="ddlTime" runat="server" CssClass="asp-form-control">
                            <asp:ListItem Value="14:00">02:00 PM - 03:30 PM</asp:ListItem>
                            <asp:ListItem Value="15:30">03:30 PM - 05:00 PM</asp:ListItem>
                            <asp:ListItem Value="17:00">05:00 PM - 06:30 PM</asp:ListItem>
                            <asp:ListItem Value="18:30">06:30 PM - 08:00 PM</asp:ListItem>
                            <asp:ListItem Value="20:00">08:00 PM - 09:30 PM</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="payment-info">
                    <strong>Payment Details:</strong><br />
                    Bank: Habib Bank Ltd (HBL) | A/C: 123456789<br />
                    EasyPaisa: 0311-1234567<br />
                    <em>Please upload the screenshot below after payment.</em>
                </div>

                <div class="form-group">
                    <label>Upload Payment Screenshot</label>
                    <asp:FileUpload ID="fuScreenshot" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvFile" ControlToValidate="fuScreenshot" Text="Payment screenshot is required." ForeColor="Red" runat="server" Display="Dynamic" />
                </div>

                <asp:Button ID="btnBook" runat="server" Text="Confirm & Submit Booking" OnClick="btnBook_Click" CssClass="btn-started" />

                <div class="mt-3 text-center">
                    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>