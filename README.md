# Smart-Bin Management System

## Overview

The APP or Smart Bin Management System is an innovative solution for monitoring and managing trash bin fill levels in public spaces. It is designed to reduce labor, time, and costs associated with waste collection. This project integrates a front-end user interface with a back-end Java application and a MySQL database to provide real-time updates on bin status, helping maintain sanitary conditions in high-traffic areas.

This repository contains the front-end HTML, CSS, JavaScript code, back-end Java code, and SQL files needed to set up and run the system locally or on a server.

## Table of Contents
- Overview
- Features
- Technologies Used
- Setup Instructions]
  - Prerequisites
- Database Structure
- Usage

## Features

- Real-time monitoring: Provides immediate insights into trash bin fill levels.
- Efficient categorization: Bins are categorized as `Full`, `Nearly Full`, or `Less Full`.
- Location-specific data: Bins are monitored across multiple public locations.
- Color-coded alerts: Easy-to-understand status updates with Red, Yellow, and Green colors.
- User-friendly interface: Clean, intuitive design for ease of use and quick navigation.

## Technologies Used

- Frontend: HTML, CSS, JavaScript
- Backend: Java (Spring Boot framework)
- Database: MySQL

### Prerequisites

- Java (JDK 11 or later)
- MySQL Server
- A code editor (IntelliJ IDEA, Eclipse, or Visual Studio Code recommended)

## Database Structure

-bins: Contains information about each monitored trash bin.
-bin_id (INT): A unique identifier for each bin.
-location (VARCHAR): A description or name of the bin’s location.
-fill_level (ENUM): Fill level indicator, which can be FULL, NEARLY, or LESS.
-status_color (VARCHAR): The color associated with the bin’s status for visual alerts (e.g., Red for FULL, Yellow for NEARLY, Green for LESS).

## Usage

-Home: Provides an overview of the application’s purpose and key features.
-Problem: Describes the waste management challenges being addressed by the application.
-Map: Displays bin locations and their current fill levels in Potheri, with status alerts for each bin.
-Location: Shows detailed information for a specific bin, including fill level and location.
-Contact: Provides contact details for inquiries or further information about the project.
