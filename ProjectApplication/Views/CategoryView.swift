//
//  CategoryView.swift
//  ProjectApplication
//
//  Created by Shahid on 11.12.22.
//

import SwiftUI

struct Images: View {
  @State var tap = false
  var title: String
  @Binding var selected: String
   var image = ""
    var body: some View {

      Button(action: {
        withAnimation(.spring()) {
          selected = title
        }
      }) {

        ZStack {
          if selected == title {
          Circle()
            TEXT
            .frame(width: 71, height:71)
            .foregroundColor(Color.theme.orange)
          Image(image)
             .renderingMode(.template)
             .foregroundColor(.gray)

          }



      }
      }
    }
}

