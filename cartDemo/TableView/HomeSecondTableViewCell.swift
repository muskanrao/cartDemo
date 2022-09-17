//
//  HomeSecondTableViewCell.swift
//  cartDemo
//
//  Created by Muskan on 17/09/22.
//

import UIKit

class HomeSecondTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var designCollectionView: UICollectionView!
    @IBOutlet weak var designLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var model2 : [Model] = []
    
    static let identifier = String(describing: HomeSecondTableViewCell.self)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        designCollectionView.register(UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Disgner Hub", attributes: underlineAttribute)
        designLabel.attributedText = underlineAttributedString
        totalPriceLabel.text = "₹ 400"
    }
    func configure(with model2: [Model]){
        self.model2 = model2
        designCollectionView.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model2.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        cell.configure(with: model2[indexPath.row])
        cell.layer.cornerRadius = 2.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 185)
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        
        model2 = []
        designCollectionView.reloadData()
        totalPriceLabel.text = "₹ 0"
        
    }
    
}
