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
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let alert = UIAlertController(title: "Reset both life counter to 20?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                self.currentLifeTotal = 20
                self.lifeLabel.text = "\(self.currentLifeTotal)"
                self.currentTopLifeTotal = 20
                self.topLifeLabel.text = "\(self.currentTopLifeTotal)"
            }))
            self.present(alert, animated: true, completion: nil)
        }
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

