@Entity
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String locationName;

    @ManyToOne
    @JoinColumn(name = "bin_id")
    private Bin bin;
    // Getters and Setters
}
