SereneMind Clinic – Therapy Booking Web Application

SereneMind Clinic is a full-stack web application developed using ASP.NET Web Forms (ASP.NET Framework) and SQL Server. The platform enables users to book therapy sessions, manage appointments, and receive automated email notifications, while administrators can manage therapists and bookings through a secure admin panel.

This project was built for academic and portfolio purposes and demonstrates real-world web application features such as authentication, role-based access, database integration, and automated email workflows.

Features
Public Pages

Home Page

About Page

Services Page

FAQs Page

Contact Page

User Features

User registration and login

User dashboard

View booking history

Book therapy sessions by selecting:

Therapy type (4 sample therapies)

Therapist

Date

Time slot

Upload payment screenshot to confirm booking

Cancel existing bookings

Automatic email notifications on:

Booking confirmation (after admin approval)

Booking cancellation

Admin Features

Secure admin login (credentials stored in SQL Server)

Admin dashboard

View all bookings

Accept or reject new booking requests

Cancel upcoming bookings

Automated email notifications sent to:

User

Assigned therapist

Auto-generated Google Meet / Gmail link included in confirmation emails

Automated Email System

On admin approval:

Confirmation email sent to both user and therapist

Includes booking details and auto-generated Gmail/meeting link

On user cancellation:

Cancellation email sent to both user and therapist

Tech Stack

Frontend

ASP.NET Web Forms (.aspx)

HTML5

CSS3

Backend

ASP.NET Framework

C#

Code-behind architecture (.aspx.cs)

ADO.NET

Database

Microsoft SQL Server (SSMS)

Other

Session-based authentication

SMTP email integration


Authentication & Roles

Admin

Credentials stored in SQL Server

Full access to admin panel and booking management

User

Can sign up and log in

Access to user dashboard and booking system

Demo Credentials (For Portfolio Use)

Admin Login

Username: admin@edchat.pk

Password: Admin123

(Demo credentials are included intentionally for evaluation and portfolio demonstration.)

Database Setup

Open SQL Server Management Studio

Create a database named:

TherapyDB


Execute the provided SQL scripts (if included)

Ensure the connection string in Web.config matches your SQL Server instance

Example:

<connectionStrings>
  <add name="TherapyDB"
       connectionString="Server=(localdb)\MSSQLLocalDB;Database=TherapyDB;Integrated Security=True;"
       providerName="System.Data.SqlClient" />
</connectionStrings>

How to Run the Project

Open the solution (.sln) file in Visual Studio

Restore NuGet packages (if prompted)

Set the project as Startup Project

Press F5 to run the application

Ensure SQL Server is running

Project Structure Overview

.aspx – UI pages

.aspx.cs – Server-side logic (code-behind)

Web.config – Configuration and database connection

SQL Server – Stores users, bookings, therapists, and admin credentials

Contributors

Huzaifa Habib

Sana Riaz

License

This project is developed for educational and portfolio purposes only.

Portfolio Note

This project demonstrates:

Full-stack ASP.NET Web Forms development

Role-based authentication

Database-driven CRUD operations

Real-world booking workflow

Automated email notifications

Version control using Git & GitHub
