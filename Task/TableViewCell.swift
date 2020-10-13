//
//  TableViewCell.swift
//  Task
//
//  Created by pratik gupta on 13/10/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var imageIvView: UIImageView!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var personsLbl: UILabel!
    
    @IBOutlet weak var singleLbl: UILabel!
    @IBOutlet weak var trophiesLbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        btn.layer.cornerRadius = 25
        btn.layer.borderWidth = 3.5
        btn.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.7529411765, blue: 0.2078431373, alpha: 1).cgColor
        
        whiteView.layer.cornerRadius = 20
        imageIvView.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnClick(_ sender: Any) {
    }
    

}
