//
//  LoginViewController.swift
//  TestMe
//
//  Created by Home on 5/10/21.
//
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate { // TextFieldDelegate is used to declare the function for pushing a key to exit keyboard input
    // Used for the "remember my login" feature
    var ud = UserDefaults.standard
    
    @IBOutlet weak var rememberMe: UILabel!
    @IBOutlet weak var sw: UISwitch!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var background: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // these delegates are used in conjunction with textFieldShouldReturn to allow the user to exit touch screen keyboard input by pushing the return key
        username.delegate = self
        password.delegate = self
        
        // rounded buttons
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.cornerCurve = .continuous
        signUpButton.layer.cornerRadius = 10.0
        signUpButton.layer.cornerCurve = .continuous
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Set the size of the layer to be equal to the size of the display
        gradientLayer.frame = view.bounds
        
        // Set an array of CGColors to create the gradient
        gradientLayer.colors = [#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).cgColor, UIColor(red: 50/255, green: 150/255, blue: 150/255, alpha: 1).cgColor]
        
        // Rasterize this layer to improve perfromance
        gradientLayer.shouldRasterize = true
        
        // Apply the gradient to the background
        background.layer.insertSublayer(gradientLayer, at: 0)
        
        // Diagonal: top left to bottom corner
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // top left
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // bottom right
        
        
        if (sw.isOn) { // if the switch is on, remember the last username/password combo entered and automatically enter it for the user
            username.text = ud.string(forKey: "username")
            password.text = ud.string(forKey: "username")
        }
    }
    
    @IBAction func signIn(_ sender: Any) {
        let thisUser = DBHelper.inst.getOneAccount(username: username.text!)
        let data = DBHelper.inst.getAccounts()
        for a in data {
            if (username.text == "admin" && password.text == "admin") { // bring up the special admin page if the username/password combo are correct
                // instantiate admin screen
                let adminPage = self.storyboard?.instantiateViewController(identifier: "admin") as! AdminViewController
                adminPage.modalPresentationStyle = .fullScreen
                self.present(adminPage, animated: true, completion: nil)
            }
            
            if (username.text == a.username! && password.text == a.password!) { // Verifies that the user credentials are in the core data and lets the user login
                // instantiate dashboard screen
                DBHelper.inst.addCurrUser(object: username.text!)
                let dashboard = self.storyboard?.instantiateViewController(identifier: "dashboard") as! DashboardViewController
                dashboard.modalPresentationStyle = .fullScreen
                self.present(dashboard, animated: true, completion: nil)
            } else if (thisUser.blockedStatus == true) {
                print("You are blocked.")
            }
        }
    }
    
    @IBAction func rememberLogin(_ sender: UISwitch) { // used for userdefaults with regards to remembering the last password/username combo input
        if (sw.isOn) {
            ud.set(sender.isOn, forKey: "mySwitchValue")
            ud.set(username.text, forKey: "username")
            ud.set(password.text, forKey: "password")
        } else {
            ud.removeObject(forKey: "username")
            ud.removeObject(forKey: "password")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) { // used for userdefaults with regards to remembering the last password/username combo input
        sw.isOn = ud.bool(forKey: "mySwitchValue")
        username.text = ud.string(forKey: "username")
        password.text = ud.string(forKey: "password")
        DBHelper.inst.addTestUser(object: ["test1":"test1"], scores: 1)
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // used to make it so the user can push the return key on the keyboard to exit out of keyboard input
        textField.resignFirstResponder()
        return true
    }
    
    //testing purposes
//    @IBAction func wipeUsers(_ sender: Any) {
//        DBHelper.inst.wipeAccounts()
//    }
    
}
