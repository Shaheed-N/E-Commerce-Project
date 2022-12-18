//
//  HotSales.swift
//  ProjectApplication
//
//  Created by Shahid on 12.12.22.
//

import SwiftUI

struct HotSales: View {
    var body: some View {
      HStack(spacing:190) {
      Text("Hot sales")
        .font(.custom(Fonts.Mark.bold, size: 25))
        Text("see more")
          .font(.custom(Fonts.Mark.regular, size: 15))
          .foregroundColor(Color.theme.orange)

      }
      ScrollView(.horizontal , showsIndicators: false) {

      }
      
    }
}

struct HotSales_Previews: PreviewProvider {
    static var previews: some View {
        HotSales()
        .previewLayout(.sizeThatFits)
    }
}
