//
//  ViewController2.swift
//  Task
//
//  Created by pratik gupta on 12/10/20.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var signOutBtn: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
}
