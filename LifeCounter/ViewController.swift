//
//  ViewController.swift
//  LifeCounter
//
//  Created by Haomin Zheng on 2019-08-19.
//  Copyright © 2019 Haomin Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    override var prefersStatusBarHidden: Bool {
      return true
    }
	
	var currentLifeTotal = 20
    var currentTopLifeTotal = 20
    var lifeHistory: [Int] = []
    var topLifeHistory: [Int] = []
    var clickTimer: Timer? = nil
    var topClickTimer: Timer? = nil
	
    @IBOutlet weak var historyTable: UITableView!
    @IBOutlet weak var topHistoryTable: UITableView!
    
    @IBOutlet weak var topLifeLabel: UILabel!
	@IBOutlet weak var lifeLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
        topLifeLabel.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        topHistoryTable.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        
        topLifeLabel.text = "\(currentTopLifeTotal)"
		lifeLabel.text = "\(currentLifeTotal)"
	}
    
    override func viewDidAppear(_ animated: Bool) {
        lifeHistory.append(20)
        topLifeHistory.append(20)
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let alert = UIAlertController(title: "Clear history and reset?", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Reset to 20", style: .default, handler: { _ in
                self.currentLifeTotal = 20
                self.lifeLabel.text = "\(self.currentLifeTotal)"
                self.currentTopLifeTotal = 20
                self.topLifeLabel.text = "\(self.currentTopLifeTotal)"
                
                self.lifeHistory = []
                self.historyTable.reloadData()
                self.lifeHistory.append(20)
                self.topLifeHistory = []
                self.topHistoryTable.reloadData()
                self.topLifeHistory.append(20)
            }))
            alert.addAction(UIAlertAction(title: "Reset to 25", style: .default, handler: { _ in
                self.currentLifeTotal = 25
                self.lifeLabel.text = "\(self.currentLifeTotal)"
                self.currentTopLifeTotal = 25
                self.topLifeLabel.text = "\(self.currentTopLifeTotal)"
                
                self.lifeHistory = []
                self.historyTable.reloadData()
                self.lifeHistory.append(25)
                self.topLifeHistory = []
                self.topHistoryTable.reloadData()
                self.topLifeHistory.append(25)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        if let timer = clickTimer {
            timer.invalidate()
        }
        
        currentLifeTotal -= 1
        lifeLabel.text = "\(currentLifeTotal)"
        
        clickTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { _ in
            self.clickTimer = nil
            self.lifeHistory.append(self.currentLifeTotal)
            self.historyTable.reloadData()
            self.historyTable.scrollToRow(at: .init(row: self.lifeHistory.count-1, section: 0), at: .none, animated: false)
        })
    }
    
    @IBAction func plus(_ sender: Any) {
        if let timer = clickTimer {
            timer.invalidate()
        }
        
        currentLifeTotal += 1
        lifeLabel.text = "\(currentLifeTotal)"
        
        clickTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { _ in
            self.clickTimer = nil
            self.lifeHistory.append(self.currentLifeTotal)
            self.historyTable.reloadData()
            self.historyTable.scrollToRow(at: .init(row: self.lifeHistory.count-1, section: 0), at: .none, animated: false)
        })
    }

    @IBAction func topMinus(_ sender: Any) {
        if let timer = topClickTimer {
            timer.invalidate()
        }
        
        currentTopLifeTotal -= 1
        topLifeLabel.text = "\(currentTopLifeTotal)"
        
        topClickTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { _ in
            self.topClickTimer = nil
            self.topLifeHistory.append(self.currentTopLifeTotal)
            self.topHistoryTable.reloadData()
            self.topHistoryTable.scrollToRow(at: .init(row: self.topLifeHistory.count-1, section: 0), at: .none, animated: false)
        })
    }
    
    @IBAction func topPlus(_ sender: Any) {
        if let timer = topClickTimer {
            timer.invalidate()
        }
        
        currentTopLifeTotal += 1
        topLifeLabel.text = "\(currentTopLifeTotal)"
        
        topClickTimer = Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false, block: { _ in
            self.topClickTimer = nil
            self.topLifeHistory.append(self.currentTopLifeTotal)
            self.topHistoryTable.reloadData()
            self.topHistoryTable.scrollToRow(at: .init(row: self.topLifeHistory.count-1, section: 0), at: .none, animated: false)
        })
    }
	
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == historyTable {
            return lifeHistory.count
        }
        else {
            return topLifeHistory.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        aCell.backgroundColor = .clear
        let textView = UITextView.init(frame: aCell.contentView.bounds)
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 20)
        textView.textColor = .white
        textView.isUserInteractionEnabled = false
        aCell.contentView.addSubview(textView)
        
        if tableView == historyTable {
            textView.text = "\(lifeHistory[indexPath.row])"
        }
        else {
            textView.text = "\(topLifeHistory[indexPath.row])"
        }
        
        return aCell
    }
}

