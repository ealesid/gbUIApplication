import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelAppTitle: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    private let demoUser = "user"
    private let demoUserPassword = "demo"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textFieldUsername.underlined()
        self.textFieldPassword.underlined()

        self.textFieldUsername.text = self.demoUser
        self.textFieldPassword.text = self.demoUserPassword

    }
    

    // MARK: - Actions

    @IBAction func buttonLoginPressed(_ sender: UIButton) {
        guard let user = self.textFieldUsername.text else {
            print("Login Input Field Error")
            return
        }
        guard let password = self.textFieldPassword.text else {
            print("Password Input Field Error")
            return
        }
        
        if user == self.demoUser && password == self.demoUserPassword {
            print("Login Successful")
        } else {
            print("Wrong username or password")
        }
    }
}
