-- Drop existing database if it exists
DROP DATABASE IF EXISTS infinitude;
CREATE DATABASE infinitude;
USE infinitude;

-- Drop tables if they already exist
DROP TABLE IF EXISTS trash;
DROP TABLE IF EXISTS locations;

-- Table for trash data with fill_percentage column
CREATE TABLE trash (
    id INT AUTO_INCREMENT PRIMARY KEY,                    -- Trash ID (Primary Key)
    location VARCHAR(255) NOT NULL,                       -- Trash Location
    status ENUM('Full', 'Nearly Full', 'Empty') NOT NULL, -- Trash Status
    color ENUM('Red', 'Yellow', 'Green') NOT NULL,        -- Trash Color Indicator
    fill_percentage INT DEFAULT 0,                        -- Fill Percentage
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP      -- Timestamp of Last Update
);

-- Table for locations
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY,                    -- Location ID (Primary Key)
    location_name VARCHAR(255) NOT NULL,                  -- Name of the Location
    trash_id INT,                                         -- Foreign Key linking to trash.id
    FOREIGN KEY (trash_id) REFERENCES trash(id)
);

-- Drop trigger if it already exists
DROP TRIGGER IF EXISTS update_color_based_on_fill_percentage;

-- Trigger to automatically set the color based on fill_percentage
DELIMITER //

CREATE TRIGGER update_color_based_on_fill_percentage
BEFORE INSERT ON trash
FOR EACH ROW
BEGIN
    IF NEW.fill_percentage >= 75 THEN
        SET NEW.color = 'Red';
    ELSEIF NEW.fill_percentage >= 50 THEN
        SET NEW.color = 'Yellow';
    ELSE
        SET NEW.color = 'Green';
    END IF;
END;
//

DELIMITER ;

-- Sample data insertion
INSERT INTO trash (location, status, fill_percentage) VALUES 
('Potheri Bus Station', 'Full', 85),                 -- This will set color to Red
('Potheri Railway Station', 'Nearly Full', 65),      -- This will set color to Yellow
('Potheri College', 'Empty', 45),                    -- This will set color to Green
('Potheri Temple', 'Nearly Full', 70),               -- This will set color to Yellow
('Potheri Mosque', 'Empty', 20),                     -- This will set color to Green
('Potheri Church', 'Full', 90),                      -- This will set color to Red
('Potheri Market', 'Empty', 20);                     -- This will set color to Green

INSERT INTO locations (location_name, trash_id) VALUES 
('Potheri Bus Station', 1),                          -- Location: Potheri Bus Station, Linked Trash ID: 1
('Potheri Railway Station', 2),                      -- Location: Potheri Railway Station, Linked Trash ID: 2
('Potheri Market', 3),                               -- Location: Potheri College, Linked Trash ID: 3
('Potheri Temple', 4),                               -- Location: Potheri Temple, Linked Trash ID: 4
('Potheri Mosque', 5),                               -- Location: Potheri Mosque, Linked Trash ID: 5
('Potheri Church', 6),                               -- Location: Potheri Church, Linked Trash ID: 6
('Potheri Market', 7);                               -- Location: Potheri Market, Linked Trash ID: 7
