//
//  ViewController.swift
//  Task
//
//  Created by pratik gupta on 12/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarConfiq()
    }
    
    private func tabBarConfiq() {
        
        guard let tabBar = self.tabBarController?.tabBar else {
            return
        }
        tabBar.barTintColor = #colorLiteral(red: 0.9600846171, green: 0.7521361113, blue: 0.2079759836, alpha: 1)
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
}

