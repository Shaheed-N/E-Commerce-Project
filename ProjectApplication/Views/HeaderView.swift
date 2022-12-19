//
//  Sheet.swift
//  ProjectApplication
//
//  Created by Shahid on 15.12.22.
//

import SwiftUI

struct HeaderView: View {

  @StateObject var vm = ContentViewModel()

    var body: some View {
        ZStack {

          GeometryReader { geo in
          HStack(spacing: 60) {

          HStack {
            Image(vm.location)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.theme.orange)
            Text(vm.place)
              .font(.custom(Fonts.Mark.medium, size: 15))
            Image("down-arrow")
              .renderingMode(.template)
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 20)
              .foregroundColor(.gray)


          }  }
          .padding(.top , geo.size.width / 6)
          .padding(.leading , geo.size.width / 3.6)


          }
        }
          }
        }

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
        .previewLayout(.sizeThatFits)
    }
}
