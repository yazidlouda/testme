//
//  RankingViewController.swift
//  TestMe
//
//  Created by Antonio Torres-Ruiz on 5/13/21.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var background: UIView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = (String(indexPath.row) + " " + String((rankingOne[0].scoreOne + rankingOne[0].scoreTwo + rankingOne[0].scoreThree + rankingOne[0].scoreFour)/rankingOne[0].quizzesTaken ) + " " + String(rankingOne[0].username!))
        case 1:
            cell.textLabel?.text = (String(indexPath.row) + " " + String((rankingOne[1].scoreOne + rankingOne[1].scoreTwo + rankingOne[1].scoreThree + rankingOne[1].scoreFour)/rankingOne[1].quizzesTaken ) + " " + String(rankingOne[1].username!))
        case 2:
            cell.textLabel?.text = (String(indexPath.row) + " " + String((rankingOne[2].scoreOne + rankingOne[2].scoreTwo + rankingOne[2].scoreThree + rankingOne[2].scoreFour)/rankingOne[2].quizzesTaken ) + " " + String(rankingOne[2].username!))
        case 3:
            cell.textLabel?.text = (String(indexPath.row) + " " + String((rankingOne[3].scoreOne + rankingOne[3].scoreTwo + rankingOne[3].scoreThree + rankingOne[3].scoreFour)/rankingOne[3].quizzesTaken ) + " " + String(rankingOne[3].username!))
        default:
            print("error")
        }
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    // Arrays used to store all of the rankings
    var rankingOne = [Account]()
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        calculateRankings()

        // Do any additional setup after loading the view.
        calculateRankings()
        
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
    
    func calcAverage (user :Account) -> Double{
        var average = (user.scoreOne + user.scoreTwo + user.scoreThree + user.scoreFour)/user.quizzesTaken
        if (average.isNaN){
            average = 0
        }
        return average
    }
    
    func calculateRankings() {
        let data = DBHelper.inst.getAccounts()
        DBHelper.inst.addTestUser(object: ["test1":"test1"], scores: 1)
        DBHelper.inst.addTestUser(object: ["test2":"test2"], scores: 2)
        DBHelper.inst.addTestUser(object: ["test3":"test3"], scores: 3)
        DBHelper.inst.addTestUser(object: ["test4":"test4"], scores: 4)
        for a in data {
            // compile all of the users' scores
            rankingOne.append(a)
            // sort by average score
            rankingOne.sort(by : ({calcAverage(user: $0) > calcAverage(user: $1)}))
            print(rankingOne)

            // sort in ascending order
        }
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
