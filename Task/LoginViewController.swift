//
//  LoginViewController.swift
//  Task
//
//  Created by pratik gupta on 12/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var googleBtn: UIButton!
    
    @IBOutlet weak var appleBtn: UIButton!
    
    @IBOutlet weak var gifImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: "animated_bg")
        roundedCorners()
    }
    
    private func roundedCorners() {
        googleBtn.layer.cornerRadius = 25
        googleBtn.layer.borderColor = UIColor.black.cgColor
        googleBtn.layer.borderWidth = 1.0
        
        appleBtn.layer.cornerRadius = 25
        appleBtn.layer.borderColor = UIColor.black.cgColor
        appleBtn.layer.borderWidth = 1.0
    }

}
