<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="TherapyWebApp.AdminDashboard" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding-top: 20px; padding-bottom: 50px; background-color: #f4f6f9; }
        .admin-dashboard {
            max-width: 1400px;
            margin: 0 auto;
            padding: 40px;
            background: white;
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
        h3 { color: #004d40; margin-top: 35px; border-bottom: 1px solid #eee; padding-bottom: 5px; }
        .card-metric { border-left: 4px solid #00796b; }
        .metric-title { color: #777; font-size: 0.9rem; text-transform: uppercase; }
        .metric-value { font-size: 2rem; font-weight: 600; color: #00796b; }
        .screenshot-thumb { height: 50px; width: auto; border: 1px solid #ddd; cursor: pointer; transition: 0.3s; }
        .screenshot-thumb:hover { transform: scale(1.1); }
    </style>
</head>
<body>
    <form runat="server">
        <div class="admin-dashboard">
            <div class="dashboard-header">
                <h2>Admin Control Panel</h2>
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger" CausesValidation="False" />
            </div>
            
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm card-metric">
                        <div class="card-body">
                            <div class="metric-title">Total Bookings</div>
                            <div class="metric-value"><asp:Literal ID="litTotalBookings" runat="server" /></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm card-metric" style="border-left-color: #fbc02d;">
                        <div class="card-body">
                            <div class="metric-title">Active Therapists</div>
                            <div class="metric-value"><asp:Literal ID="litTotalTherapists" runat="server" /></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm card-metric" style="border-left-color: #e53935;">
                        <div class="card-body">
                            <div class="metric-title">Total Users</div>
                            <div class="metric-value"><asp:Literal ID="litTotalUsers" runat="server" /></div>
                        </div>
                    </div>
                </div>
            </div>

            <h3>Booking Management</h3>
            <div class="card p-3 mb-4 shadow-sm bg-light">
                <div class="form-row align-items-center">
                    <div class="col-md-8 mb-2">
                        <asp:TextBox ID="txtSearchTerm" runat="server" CssClass="form-control" placeholder="Search by Therapist, User Email, or Therapy Type" />
                    </div>
                    <div class="col-md-2 mb-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary btn-block" />
                    </div>
                    <div class="col-md-2 mb-2">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-outline-secondary btn-block" />
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false" 
                    CssClass="table table-hover table-striped shadow-sm" HeaderStyle-CssClass="thead-dark" 
                    OnRowCommand="gvBookings_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="ID" />
                        <asp:BoundField DataField="UserEmail" HeaderText="User Email" />
                        <asp:BoundField DataField="Therapist" HeaderText="Therapist" />
                        <asp:BoundField DataField="Therapy" HeaderText="Therapy" />
                        <asp:BoundField DataField="SessionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="TimeSlot" HeaderText="Slot" />
                        <asp:TemplateField HeaderText="Payment Proof">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlImg" runat="server" NavigateUrl='<%# Eval("PaymentScreenshot") %>' Target="_blank">
                                    <asp:Image ID="imgProof" runat="server" ImageUrl='<%# Eval("PaymentScreenshot") %>' CssClass="screenshot-thumb" AlternateText="No Image" />
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnApprove" runat="server" Text="Confirm" CommandName="Approve" 
                                    CommandArgument='<%# Eval("BookingID") %>' CssClass="btn btn-sm btn-success" 
                                    Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                                <asp:LinkButton ID="btnReject" runat="server" Text="Reject" CommandName="Reject" 
                                    CommandArgument='<%# Eval("BookingID") %>' CssClass="btn btn-sm btn-danger" 
                                    Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

           
        </div>
    </form>
</body>
</html>