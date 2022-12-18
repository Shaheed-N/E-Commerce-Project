//
//  CategoryModel.swift
//  ProjectApplication
//
//  Created by Shahid on 11.12.22.
//

import Foundation

struct Categories: Identifiable {
  var id: String = UUID().uuidString
  var category: String
  var text: String

}

var all = [
  Categories(category: "Phone" , text: "Phones"),
  Categories(category: "Computers", text: "Computer"),
  Categories(category: "Book", text: "Books"),
  Categories(category: "Heart", text: "Health"),
  Categories(category: "", text: "")

]
