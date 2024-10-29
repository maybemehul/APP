@Entity
public class Bin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String location;
    private String status;
    private String color;
    private Timestamp lastUpdated;
    // Getters and Setters
}
