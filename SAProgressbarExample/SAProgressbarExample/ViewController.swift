//
//  ViewController.swift
//  SAProgressbarExample
//
//  Created by Shabbir Ahmad on 30/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saProgressbar: SAProgressbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saProgressbar.noOfBar = 5
        saProgressbar.timeCount = 2
        saProgressbar.willBarChanged = { index in
            print("will bar changed at index: \(index)")
        }
        saProgressbar.didBarChanged = { index in
            print("did bar changed at index: \(index)")
        }
        
    }

    @IBAction func startLoading(_ sender: UIButton) {
        saProgressbar.startLoading(page: 0)
    }
    
}

