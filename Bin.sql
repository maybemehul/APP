-- Create database
CREATE DATABASE smart_bin_management;
USE smart_bin_management;

-- Table for bin data
CREATE TABLE bins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    status ENUM('Full', 'Nearly Full', 'Empty') NOT NULL,
    color ENUM('Red', 'Yellow', 'Green') NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for locations
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(255) NOT NULL,
    bin_id INT,
    FOREIGN KEY (bin_id) REFERENCES bins(id)
);

-- Table for contact messages
CREATE TABLE contact_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data insertion
INSERT INTO bins (location, status, color) VALUES 
('Potheri Bus Station', 'Full', 'Red'),
('Potheri Railway Station', 'Nearly Full', 'Yellow'),
('Potheri Market', 'Empty', 'Green');

INSERT INTO locations (location_name, bin_id) VALUES 
('Potheri Bus Station', 1),
('Potheri Railway Station', 2),
('Potheri Market', 3);
