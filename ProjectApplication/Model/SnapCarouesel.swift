//
//  SnapCarouesel.swift
//  ProjectApplication
//
//  Created by Shahid on 14.12.22.
//
import Foundation

struct Snap: Codable, Identifiable {
    let cpu, camera: String
    let capacity, color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd, ssd, title: String

    enum CodingKeys: String, CodingKey {
        case cpu = "CPU"
        case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
    }
}



