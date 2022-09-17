//
//  HomeViewController.swift
//  cartDemo
//
//  Created by Muskan on 17/09/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var models : [Model] = []
    var models2: [Model] = []
    
   
    @IBOutlet weak var fruitTableView: UITableView!
    @IBOutlet weak var designTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cart"
        navigationItem.titleView?.tintColor = .black
        navigationItem.backButtonTitle = ""
        
        models.append(Model(name: "Kinnaur Apple", imageName: "apple", cutoffPrice: "199", actualPrice: "159", amount: "1Kg"))
        models.append(Model(name: "Yellow Pumpkin", imageName: "pumpkin", cutoffPrice: "44", actualPrice: "40", amount: "1"))
        models.append(Model(name: "Small Tindey", imageName: "tindey", cutoffPrice: "119", actualPrice: "110", amount: "1Kg"))
        models.append(Model(name: "Kiwi", imageName: "kiwi", cutoffPrice: "50", actualPrice: "45", amount: "1 pcs"))
        
        models2.append(Model(name: "Kurti", imageName: "cloth", cutoffPrice: "800", actualPrice: "400", amount: "6"))
        
        fruitTableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        designTableView.register(UINib(nibName: HomeSecondTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeSecondTableViewCell.identifier)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView{
            return 1
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView{
        case fruitTableView:
            let cell = fruitTableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
            cell.configure(with: models)
            cell.layer.cornerRadius = 2.0
            cell.layer.borderWidth = 0.1
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            cell.layer.shadowRadius = 5.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        case designTableView:
            let cell = designTableView.dequeueReusableCell(withIdentifier: HomeSecondTableViewCell.identifier, for: indexPath) as! HomeSecondTableViewCell
            cell.configure(with: models2)
            cell.layer.cornerRadius = 2.0
            cell.layer.borderWidth = 0.1
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            cell.layer.shadowRadius = 10.0
            cell.layer.shadowOpacity = 1
            cell.layer.masksToBounds = false
            return cell
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    

    @IBAction func homeButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        navigationController?.popToRootViewController(animated: true)
      
        
    }
    
}

