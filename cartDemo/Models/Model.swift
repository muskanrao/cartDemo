//
//  Model.swift
//  cartDemo
//
//  Created by Muskan on 17/09/22.
//

import Foundation

struct Model{
    let name: String
    let imageName: String
    let cutoffPrice : String
    let actualPrice : String
    let amount : String
    init(name: String,imageName: String, cutoffPrice: String, actualPrice: String,amount: String){
        self.name = name
        self.imageName = imageName
        self.cutoffPrice = cutoffPrice
        self.actualPrice = actualPrice
        self.amount = amount
    }
    
}
