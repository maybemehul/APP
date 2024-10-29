@RestController
@RequestMapping("/api/contact")
public class ContactMessageController {

    @Autowired
    private ContactMessageRepository contactMessageRepository;

    @PostMapping
    public ContactMessage submitContactMessage(@RequestBody ContactMessage message) {
        return contactMessageRepository.save(message);
    }
}
