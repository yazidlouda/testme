//
//  LogoutConfirmViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/13/21.
//

import UIKit

class LogoutConfirmViewController: UIViewController {

    @IBOutlet weak var noBut: UIButton!
    @IBOutlet weak var yesBut: UIButton!
    @IBOutlet var background: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Create a gradient layer
        let gradientLayer = CAGradientLayer()
        
        // Set the size of the layer to be equal to the size of the display
        gradientLayer.frame = view.bounds
        
        // Set an array of CGColors to create the gradient
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1).cgColor, UIColor(red: 50/255, green: 180/255, blue: 150/255, alpha: 1).cgColor]
        
        // Rasterize this layer to improve perfromance
        gradientLayer.shouldRasterize = true
        
        // Apply the gradient to the background
        background.layer.insertSublayer(gradientLayer, at: 0)
        
        yesBut.layer.cornerRadius = 10.0
        yesBut.layer.cornerCurve = .continuous
        
        noBut.layer.cornerRadius = 10.0
        noBut.layer.cornerCurve = .continuous
    }
    

    @IBAction func logOutConfirmed(_ sender: Any) {
        let login = self.storyboard?.instantiateViewController(identifier: "login") as! LoginViewController
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: true, completion: nil)
    }
    
    @IBAction func goBackToDashboard(_ sender: Any) {
        let db = self.storyboard?.instantiateViewController(identifier: "dashboard") as! DashboardViewController
        db.modalPresentationStyle = .fullScreen
        self.present(db, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
