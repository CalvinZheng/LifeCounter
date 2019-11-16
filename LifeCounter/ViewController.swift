//
//  ViewController.swift
//  LifeCounter
//
//  Created by Haomin Zheng on 2019-08-19.
//  Copyright © 2019 Haomin Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var currentLifeTotal = 20
    var currentTopLifeTotal = 20
	
    @IBOutlet weak var topLifeLabel: UILabel!
    
	@IBOutlet weak var lifeLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
        topLifeLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        topLifeLabel.text = "\(currentTopLifeTotal)"
		lifeLabel.text = "\(currentLifeTotal)"
	}

    @IBAction func topMinus(_ sender: Any) {
        currentTopLifeTotal -= 1
        topLifeLabel.text = "\(currentTopLifeTotal)"
    }
    
    @IBAction func topPlus(_ sender: Any) {
        currentTopLifeTotal += 1
        topLifeLabel.text = "\(currentTopLifeTotal)"
    }
    
	@IBAction func minus(_ sender: Any) {
		currentLifeTotal -= 1
		lifeLabel.text = "\(currentLifeTotal)"
	}
    
	@IBAction func plus(_ sender: Any) {
		currentLifeTotal += 1
		lifeLabel.text = "\(currentLifeTotal)"
	}
	
}

