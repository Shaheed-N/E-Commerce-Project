//
//  CarouselViewModel.swift
//  ProjectApplication
//
//  Created by Shahid on 12.12.22.
//
import SwiftUI
import Foundation

class CaroueselViewModel: ObservableObject {
@Published var items = [Snap]()
@Published var camera: String = ""
@Published var image: [String] = []
@Published var cpu: String = ""
@Published var sd: String = ""
@Published var ssd: String = ""
@Published var title: String = ""


init() {
    fetchData()
  }

  func fetchData() {
    let api = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode(Snap.self, from: data)
           DispatchQueue.main.async {
             self.camera = result.camera
             self.image = result.images
             self.cpu = result.cpu
             self.ssd = result.ssd
             self.sd = result.sd
             self.title = result.title
             
           }
         } else {
           print("No data")
         }
      } catch (let error) {
         print(error.localizedDescription)
      }
     }.resume()
  }
}

