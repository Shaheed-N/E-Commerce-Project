//
//  BasketService.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import Foundation

class BasketApi : ObservableObject {

func loadData(completion:@escaping (Info) -> ()) {
          guard let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149") else {
              print("Invalid url…")
              return
          }
          URLSession.shared.dataTask(with: url) { data, response, error in
              let result = try! JSONDecoder().decode(Info.self, from: data!)
              print(result)
              DispatchQueue.main.async {
               completion(result)

              }
          }.resume()
      }
}
