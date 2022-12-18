//
//  ProductPageView.swift
//  ProjectApplication
//
//  Created by Shahid on 15.12.22.
//

import SwiftUI

struct DetailView: View {

  var width = UIScreen.main.bounds.width

    var body: some View {
      
      GeometryReader {
        geo in

        HStack(spacing: 70) {
          
          HStack(spacing: geo.size.width * 0.17) {


      Text("Product Details")
        .font(.custom(Fonts.Mark.medium, size: 18))
      ZStack {

      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.theme.orange)
        .frame(width: 37, height: 37)
        Image(systemName: "bag")
          .foregroundColor(.white)
          .frame(width: 13, height: 14)
      }
      }
    }
        .offset(x: 20, y: -30)
      }
      }
    }


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      DetailView()
        .previewLayout(.sizeThatFits)
    }
}
