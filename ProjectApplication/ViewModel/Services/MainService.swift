//
//  MainService.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import Foundation
class APIHelper : ObservableObject {

func loadData(completion:@escaping (Welcome) -> ()) {
          guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else {
              print("Invalid url…")
              return
          }
          URLSession.shared.dataTask(with: url) { data, response, error in
              let result = try! JSONDecoder().decode(Welcome.self, from: data!)
              print(result)
              DispatchQueue.main.async {
               completion(result)

              }
          }.resume()
      }
  }
