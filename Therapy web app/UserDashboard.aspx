<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="TherapyWebApp.UserDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard - My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding-top: 20px; padding-bottom: 50px; background-color: #f4f6f9; }
        .user-dashboard-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #00796b;
            padding-bottom: 15px;
        }
        h2 { color: #00796b; font-weight: 300; }
        h3 { color: #004d40; margin-top: 30px; border-bottom: 1px solid #ddd; padding-bottom: 5px; }
        .user-info-card {
            border-left: 4px solid #00796b;
            padding: 15px;
            background-color: #e0f2f1;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .status-cancelled { color: #d32f2f; font-weight: bold; }
        .status-pending { color: #f57c00; font-weight: bold; }
    </style>
</head>
<body>
    <form runat="server">
        <div class="user-dashboard-container">
            <div class="dashboard-header">
                <h2>Welcome, <asp:Literal ID="litUserEmail" runat="server" /></h2>
                <div>
                    <asp:LinkButton ID="btnBookNew" runat="server" PostBackUrl="Booking.aspx" CssClass="btn btn-success mr-2">Book New Session</asp:LinkButton>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger" CausesValidation="False" />
                </div>
            </div>

            <div class="user-info-card shadow-sm">
                <p><strong>User ID:</strong> <asp:Literal ID="litUserID" runat="server" /></p>
                <p><strong>Account Email:</strong> <asp:Literal ID="litUserEmailDisplay" runat="server" /></p>
            </div>

            <h3>Upcoming Sessions</h3>
            <div class="table-responsive">
                <asp:GridView ID="gvUpcoming" runat="server" AutoGenerateColumns="false" 
                    CssClass="table table-hover table-striped shadow-sm" OnRowCommand="gvUpcoming_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="ID" />
                        <asp:BoundField DataField="TherapyName" HeaderText="Therapy" />
                        <asp:BoundField DataField="TherapistName" HeaderText="Therapist" />
                        <asp:BoundField DataField="SessionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="TimeSlot" HeaderText="Time Slot" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# Eval("Status").ToString() == "Pending" ? "status-pending" : "" %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                                    CommandName="CancelBooking" CommandArgument='<%# Eval("BookingID") %>' 
                                    CssClass="btn btn-sm btn-outline-danger" 
                                    OnClientClick="return confirm('Are you sure you want to cancel this booking?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="p-3">No upcoming sessions found.</div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>

            <h3>Past & Cancelled History</h3>
            <div class="table-responsive">
                <asp:GridView ID="gvPast" runat="server" AutoGenerateColumns="false" 
                    CssClass="table table-sm table-hover text-muted">
                    <Columns>
                        <asp:BoundField DataField="TherapyName" HeaderText="Therapy" />
                        <asp:BoundField DataField="SessionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                    </Columns>
                </asp:GridView>
            </div>
            
            <div class="mt-3">
                <asp:Label ID="lblBookingMessage" runat="server" Font-Bold="true" />
            </div>
        </div>
    </form>
</body>
</html>