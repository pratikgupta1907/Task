//
//  ViewController.swift
//  Task
//
//  Created by pratik gupta on 12/10/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import ProgressHUD
import Kingfisher

class ViewController: UIViewController {
    
    var arrData = [Model]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarConfiq()
        fetchData()
    }
    
    private func tabBarConfiq() {
        
        guard let tabBar = self.tabBarController?.tabBar else {
            return
        }
        tabBar.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.7529411765, blue: 0.2078431373, alpha: 1)
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderWidth = 0.2
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func fetchData() {
        ProgressHUD.show("Loading...")

        let urlString = "https://testapi.thegamingbattle.com/tournament"
        
        let header : HTTPHeaders = ["Content-Type":"application/json"]
        
        guard let profileUrl = URL(string: urlString) else { return }
        
        
        AF.request(profileUrl,method:.get, parameters: nil, encoding: JSONEncoding.default ,headers:header).responseJSON { response in
            
            let responseData = response.result
            
            switch responseData {
                
            case .success(let value):
                let json = JSON(value)
                let tournaments = json["tournaments"]
                for arr in tournaments.arrayValue {
                    self.arrData.append(Model(json : arr))
                }
                DispatchQueue.main.async {
                    ProgressHUD.dismiss()
                    self.tableView.reloadData()
                }
                
            case .failure(let afError):
                print(afError.errorDescription!)
            }
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.personsLbl.text = arrData[indexPath.row].totalParticipant ?? "nil"
        cell.singleLbl.text = arrData[indexPath.row].team ?? "nil"
        cell.trophiesLbl.text = arrData[indexPath.row].totalPrize ?? "nil"
        
        let str = arrData[indexPath.row].startDate!
        
        let startIndex = str.index(str.startIndex, offsetBy: 0)
        let endIndex = str.index(str.startIndex, offsetBy: 9)
        cell.dateLbl.text = String(str[startIndex...endIndex])
        
        let url: URL?
        if arrData[indexPath.row].image .contains(" ") {
            url = URL(string: arrData[indexPath.row].image.trimmingCharacters(in: .whitespacesAndNewlines))
        } else {
            url = URL(string: arrData[indexPath.row].image)

        }
        cell.imageIvView.kf.setImage(with: url)
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}
