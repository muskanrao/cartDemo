//
//  HomeCollectionViewCell.swift
//  cartDemo
//
//  Created by Muskan on 17/09/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var cutoffPricee: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    static let identifier = String(describing: HomeCollectionViewCell.self)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Your Text")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        cutoffPricee.attributedText = attributeString
        
    }
    
    public func configure(with model: Model){
        image.image = UIImage(named: model.imageName)
        actualPrice.text = String("₹\(model.actualPrice)")
        
        cutoffPricee.text = String("₹\(model.cutoffPrice)")
        name.text = model.name
        amount.text = model.amount
        
    }

}
