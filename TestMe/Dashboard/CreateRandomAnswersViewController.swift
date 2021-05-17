//
//  CreateRandomAnswersViewController.swift
//  TestMe
//
//  Created by Home on 5/13/21.
//

import UIKit

class CreateRandomAnswersViewController: UIViewController {

    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var q4: UILabel!
    @IBOutlet weak var q5: UILabel!
    
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var q1a1: UITextField!
    @IBOutlet weak var q1a2: UITextField!
    @IBOutlet weak var q1a3: UITextField!
    
    @IBOutlet weak var q2a1: UITextField!
    @IBOutlet weak var q2a2: UITextField!
    @IBOutlet weak var q2a3: UITextField!
    
    
    @IBOutlet weak var q3a1: UITextField!
    @IBOutlet weak var q3a2: UITextField!
    @IBOutlet weak var q3a3: UITextField!
    
    @IBOutlet weak var q4a1: UITextField!
    @IBOutlet weak var q4a2: UITextField!
    @IBOutlet weak var q4a3: UITextField!
    
    @IBOutlet weak var q5a1: UITextField!
    @IBOutlet weak var q5a2: UITextField!
    @IBOutlet weak var q5a3: UITextField!
    @IBOutlet weak var category: UITextField!
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
    }
    
    @IBAction func submit(_ sender: Any) {
        let data = DBHelper.inst.getQuestions()
        for q in data {
            let dic = ["r1" : q1a1.text!, "r2" : q1a2.text!, "r3" : q1a3.text!, "r4" : q2a1.text!, "r5" : q2a2.text!,"r6" : q2a3.text!,"r7" : q3a1.text!, "r8" : q3a2.text!, "r9" : q3a3.text!, "r10" : q4a1.text!, "r11" : q4a2.text!,"r12" : q4a3.text!,"r13" : q5a1.text!, "r14" : q5a2.text!,"r15" : q5a3.text!, "category" : category.text! ]
            DBHelper.inst.addAnswerss(object: dic)
        }
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let data = DBHelper.inst.getQuestions()
        for a in data{
            q1.text = a.q1!
            q2.text = a.q2!
            q3.text = a.q3!
            q4.text = a.q4!
            q5.text = a.q5!
          
        }
    }

}
