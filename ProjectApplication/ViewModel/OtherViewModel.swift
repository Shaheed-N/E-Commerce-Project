//
//  OtherViewModel.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import Foundation
import SwiftUI
class OtherViewModel: ObservableObject {
  @Published var total: Int = 2
  @Published var delivery: String = ""

  init() {
    fetchData()
  }

  func fetchData() {
    let api = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode(Info.self, from: data)
           DispatchQueue.main.async {
             self.total = result.total
             self.delivery = result.delivery
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

