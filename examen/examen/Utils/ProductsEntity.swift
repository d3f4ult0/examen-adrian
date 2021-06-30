//
//  ProductsEntity.swift
//  examen
//
//  Created by BE-006 on 29/06/21.
//

import Foundation

struct Products:Codable {
    var numberOfProducts:Int
    var productDetails:[ProductDetails]
}

struct ProductDetails:Codable {
    var title:String
    var imageUrl:String
    var primaryOffer:PrimaryOffer
}

struct PrimaryOffer:Codable {
    var offerPrice:Int
    var currencyCode:String
}

struct Body:Codable {
    var text:String
}
