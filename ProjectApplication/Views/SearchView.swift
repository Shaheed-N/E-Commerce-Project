//
//  SearchView.swift
//  ProjectApplication
//
//  Created by Shahid on 12.12.22.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
      
      HStack(spacing:10) {
      ZStack {
        RoundedRectangle(cornerRadius: 50)
        .fill(Color.white)
        .frame(width: 300, height: 34)
        HStack(spacing:18) {
        Image("Search")
        Text("Search")
        .font(.custom(Fonts.Mark.regular, size: 12))
        .foregroundColor(.gray)
          
        }
        .offset(x: -90)

        
 }
        

        ZStack {

        Circle()
          .frame(width: 34, height: 34)
          .foregroundColor(Color.theme.orange)
          Image("Group")

      }    }
}
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
        .previewLayout(.sizeThatFits)

    }
}
