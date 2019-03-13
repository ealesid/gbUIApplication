import UIKit

class LoginFormViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelAppTitle: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    
    private let segueAppStart = "appStart"
    
    private let demoUser = "user"
    private let demoUserPassword = "demo"
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.addNotifications()
        
        self.textFieldUsername.underlined()
        self.textFieldPassword.underlined()

        self.textFieldUsername.text = self.demoUser
        self.textFieldPassword.text = self.demoUserPassword

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.removeNotifications()
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
            self.performSegue(withIdentifier: self.segueAppStart, sender: self)
        } else {
            print("Wrong username or password")
        }
    }
    
    @IBAction func clodeKeyboardAction() {
        print("closeKeybordAction")
        self.view.endEditing(true)
    }
    
    @IBAction func logout(segue: UIStoryboardSegue) {}
}


extension LoginFormViewController {

    @objc private func keyboardWasShown(notification: Notification) {
        guard let userInfo = notification.userInfo as NSDictionary? else {
            return
        }
        guard let keyboardFrame = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardHeight, right: 0.0)
        
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView?.contentInset = contentInsets
        self.scrollView?.scrollIndicatorInsets = contentInsets
    }

    private func addNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeNotifications() {
        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.removeObserver(
            self, name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
}
