//
//  CarouselModel.swift
//  ProjectApplication
//
//  Created by Shahid on 12.12.22.
//

import Foundation

struct Welcome: Codable {
    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]

    enum CodingKeys: String, CodingKey {
        case homeStore = "home_store"
        case bestSeller = "best_seller"
    }
}

struct BestSeller: Codable, Identifiable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount, discountPrice: Int
    let picture: String

    enum CodingKeys: String, CodingKey {
        case id
        case isFavorites = "is_favorites"
        case title
        case priceWithoutDiscount = "price_without_discount"
        case discountPrice = "discount_price"
        case picture
    }
}

struct HomeStore: Codable , Identifiable{
    let id: Int
    let isNew: Bool?
    let title, subtitle: String
    let picture: String
    let isBuy: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case isNew = "is_new"
        case title, subtitle, picture
        case isBuy = "is_buy"
    }
}

struct Posts: Identifiable {
  let id = UUID()
  let title: String
  let subtitle: String

  init(with model: HomeStore) {
    self.title = model.title
    self.subtitle = model.subtitle
}
}
