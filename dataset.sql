-- Create database
CREATE DATABASE infinitude;
USE infinitude;

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


-- Trigger to automatically set color based on fill_percentage
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
('Potheri College', 'Empty', 45);                     -- This will set color to Green

INSERT INTO locations (location_name, trash_id) VALUES 
('Potheri Bus Station', 1),                          -- Location: Potheri Bus Station, Linked Trash ID: 1
('Potheri Railway Station', 2),                      -- Location: Potheri Railway Station, Linked Trash ID: 2
('Potheri College', 3);                               -- Location: Potheri Market, Linked Trash ID: 3
