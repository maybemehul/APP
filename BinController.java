@RestController
@RequestMapping("/api/bins")
public class BinController {

    @Autowired
    private BinRepository binRepository;

    @GetMapping
    public List<Bin> getAllBins() {
        return binRepository.findAll();
    }
}
