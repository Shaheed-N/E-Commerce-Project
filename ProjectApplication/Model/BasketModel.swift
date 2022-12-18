//
//  BasketModel.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import Foundation

struct Info: Codable {
    let basket: [Basket]
    let delivery, id: String
    let total: Int
}

struct Basket: Codable, Identifiable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
