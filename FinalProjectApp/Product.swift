//
//  Product.swift
//  FinalProjectApp
//
//  Created by Sunny Karim on 1/6/21.
//

import Foundation

class Product {
    
    var productType:String
    var productName:String
    var productPrice: Double
    var retailer: String
    var datePurchased:String
    var numDaysRtrn: String
    
    init (productType: String, productName: String, productPrice: Double,
          retailer: String, datePurchased: String, numDaysRtrn: String)  {
        self.productType = productType
        self.productName = productName
        self.productPrice = productPrice
        self.retailer = retailer
        self.datePurchased = datePurchased
        self.numDaysRtrn = numDaysRtrn
    }
}
