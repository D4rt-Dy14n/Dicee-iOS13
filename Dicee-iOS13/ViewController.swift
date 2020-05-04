//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Yuri Fedorov on 11/06/2019.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var rollButton: UIButton!
    
    var defaults = UserDefaults.init()
    
    var total = 0
    var count = 0
    var average: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    clearButton.isEnabled = false
    clearButton.isUserInteractionEnabled = false
    clearButton.layer.opacity = 0.5
    clearButton.layer.cornerRadius = 10
    rollButton.layer.cornerRadius = 10
    }
    
    
    
//  Roll Button
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        let randomNumber1 = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        diceImageView1.image = diceArray[randomNumber1]
        diceImageView2.image = diceArray[randomNumber2]
 
// Cumulative adding the numbers to sum1 and sum2
        var sum1 = 0
        switch randomNumber1 {
        case 0:
            sum1 += 1
        case 1:
            sum1 += 2
        case 2:
            sum1 += 3
        case 3:
            sum1 += 4
        case 4:
            sum1 += 5
        case 5:
            sum1 += 6
        default:
            break
        }
        
        var sum2 = 0
        switch randomNumber2 {
        case 0:
            sum2 += 1
        case 1:
            sum2 += 2
        case 2:
            sum2 += 3
        case 3:
            sum2 += 4
        case 4:
            sum2 += 5
        case 5:
            sum2 += 6
        default:
            break
        }
 
// Counting the total amount of points, quantity of rolls and average value.
        total += (sum1 + sum2)
        count += 1
        average = Double(total) / Double(count)
        let averageRounded = String(format: "%.2f", average)

        countLabel.text = "Count: \(count)"
        totalLabel.text = "Total: \(total)"
        averageLabel.text = "Average:" + " " + averageRounded
    
        
//  Saving defaults
        defaults.set(count, forKey: "count")
        defaults.set(total, forKey: "total")
        defaults.set(average, forKey: "average")
        
        clearButton.isEnabled = true
        clearButton.isUserInteractionEnabled = true
        clearButton.layer.opacity = 1
    
    }
//  Clear Button
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        defaults.set(0, forKey: "count")
        defaults.set(0, forKey: "total")
        defaults.set(0, forKey: "average")
        
        count = 0
        total = 0
        average = 0
        
        countLabel.text = "Count: \(count)"
        totalLabel.text = "Total: \(total)"
        averageLabel.text = "Average: \(average)"
// Clear button becomes disabled and semitransparent after clicking.
        clearButton.isEnabled = false
        clearButton.isUserInteractionEnabled = false
        clearButton.layer.opacity = 0.5
    
    }
}
