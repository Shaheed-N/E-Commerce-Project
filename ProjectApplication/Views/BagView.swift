//
//  BagView.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI

struct BagView: View {
  @Binding var showTabBar: Bool
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var viewRouter: ViewRouters

    var body: some View {
      VStack {
        
        HStack(spacing: 70) {
          Button(action: {
            viewRouter.currentPage = .page2
   }) {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .frame(width: 37, height: 37)
            .foregroundColor(Color.theme.blue)
          Image(systemName: "chevron.left")
              .foregroundColor(.white)
              .frame(width: 14, height: 7)

        }
          }



      .offset(x: -15, y: 8)

               HStack {

                 HStack(spacing: 15) {


             Text("Add address")
                     .foregroundColor(.black)
               .font(.custom(Fonts.Mark.medium, size: 18))
             ZStack {

             RoundedRectangle(cornerRadius: 10)
               .foregroundColor(Color.theme.orange)
               .frame(width: 37, height: 37)
               Image("location")
                 .resizable()
                 .renderingMode(.template)
                 .foregroundColor(.white)

                 .frame(width: 14, height: 17)

             }
             }
               }
                 .offset(y:10)
                 .offset(x: 40)

           }

        CartView(showTabBar: $showTabBar)

      }

    }
}


struct BagView_Previews: PreviewProvider {
    static var previews: some View {
      BagView(showTabBar: .constant(true))
        .environmentObject(ViewRouters())
    }
}
