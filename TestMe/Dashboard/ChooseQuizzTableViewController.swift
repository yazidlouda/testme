//
//  ChooseQuizzTableViewController.swift
//  TestMe
//
//  Created by Home on 5/11/21.
//

import UIKit

class ChooseQuizzTableViewController: UITableViewController {
    @IBOutlet var background: UIView!
    static var totalScore = 0.0
    // name will be based on available quizz name
    //TODO
    
    var name = ["test1", "test2","test3","test4","test5"]
    override func viewDidLoad() {
        super.viewDidLoad()

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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //number will be based on number of available quizz
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    @IBAction func start(_ sender: Any) {
        
    }
    
    

}
