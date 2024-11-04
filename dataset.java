import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

class InfinitudeTrashManagement {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/infinitude";
        String user = "root";    // your MySQL username
        String password = "Ihaveadream@2025"; // your MySQL password

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            // Check if fill_percentage column exists
            ResultSet rs = stmt.executeQuery("SHOW COLUMNS FROM trash LIKE 'fill_percentage'");
            if (!rs.next()) {
                // Alter table to add fill_percentage column if not already present
                String alterTable = "ALTER TABLE trash ADD COLUMN fill_percentage INT DEFAULT 0";
                stmt.executeUpdate(alterTable);
                System.out.println("Column fill_percentage added to trash table.");
            } else {
                System.out.println("Column fill_percentage already exists in trash table.");
            }

            // Drop the existing trigger if it exists
            try {
                stmt.execute("DROP TRIGGER IF EXISTS update_color_based_on_fill_percentage");
                System.out.println("Existing trigger dropped.");
            } catch (Exception e) {
                System.out.println("Error dropping trigger: " + e.getMessage());
            }

            // Create trigger to set color based on fill_percentage
            String createTrigger =
                    "CREATE TRIGGER update_color_based_on_fill_percentage " +
                            "BEFORE INSERT ON trash " +
                            "FOR EACH ROW " +
                            "BEGIN " +
                            "    IF NEW.fill_percentage >= 75 THEN " +
                            "        SET NEW.color = 'Red'; " +
                            "    ELSEIF NEW.fill_percentage >= 50 THEN " +
                            "        SET NEW.color = 'Yellow'; " +
                            "    ELSE " +
                            "        SET NEW.color = 'Green'; " +
                            "    END IF; " +
                            "END;";
            stmt.execute(createTrigger);
            System.out.println("Trigger created to update color based on fill_percentage.");

            // Insert sample data
            String insertData = "INSERT INTO trash (location, status, fill_percentage) VALUES " +
                    "('Potheri Bus Station', 'Full', 85), " +
                    "('Potheri Railway Station', 'Nearly Full', 65), " +
                    "('Potheri Market', 'Empty', 45)";
            stmt.executeUpdate(insertData);

            System.out.println("Sample data inserted into trash table successfully.");

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
