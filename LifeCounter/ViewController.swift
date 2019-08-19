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
	
	
	@IBOutlet weak var lifeLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		lifeLabel.text = "\(currentLifeTotal)"
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

