//
//  ViewController.swift
//  dice
//
//  Created by Peggy Tsai on 2018/5/21.
//  Copyright © 2018年 Peggy Tsai. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet var leftDices: [UIImageView]!
    @IBOutlet var rightDices: [UIImageView]!
    @IBOutlet weak var leftDicesLabel: UILabel!
    @IBOutlet weak var rightDicesLabel: UILabel!
    @IBOutlet weak var sumDicesLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    let images = ["one","two","three","four","five","six"]
    var randomDistribution: GKRandomDistribution!
    var leftSum = 0
    var rightSum = 0
    var sum = 0
    @IBAction func dicesButtonPress(_ sender: UIButton) {
        switch sender {
        case leftButton:
            leftSum = 0
            for i in 0...2{
                let number = randomDistribution.nextInt()
                let imageName = images[number-1]
                leftDices[i].image = UIImage(named:imageName )
                leftSum += number
            }
            leftDicesLabel.text = "左邊骰子點數和\n" + "\(leftSum)"
        case rightButton:
            rightSum = 0
            for i in 0...2{
                let number = randomDistribution.nextInt()
                let imageName = images[number-1]
                rightDices[i].image = UIImage(named:imageName )
                rightSum += number
            }
            rightDicesLabel.text = "右邊骰子點數和\n" + "\(rightSum)"
        default:
            break
        }
        sum = leftSum + rightSum
        sumDicesLabel.text = "所有骰子點數和\n" + "\(sum)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomDistribution = GKRandomDistribution(lowestValue: 1, highestValue: images.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

