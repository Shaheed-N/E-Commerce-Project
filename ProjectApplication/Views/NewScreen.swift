//
//  NewScreen.swift
//  ProjectApplication
//
//  Created by Shahid on 18.12.22.
//

import SwiftUI


struct NewScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
  var a: Double = 0.0
  @Binding var showTabBar: Bool
  var b = 0

    var body: some View {


        ZStack(alignment: .topLeading) {
          GeometryReader { geo in

          RoundedRectangle(cornerRadius: 30)
              .frame(width: geo.size.width * 1, height: geo.size.width * 3.9)
            .foregroundColor(.white)
            .shadow(radius: 20)
            .foregroundColor(.white)

            VStack(alignment: .leading) {
              HStack(spacing: 70) {
                HStack(spacing: geo.size.width * 0.14) {

            Button(action: {

                showNewScreen.toggle()
            }, label: {

              ZStack {
                RoundedRectangle(cornerRadius: 10)
                  .frame(width: 37, height: 37)
                  .foregroundColor(Color.theme.blue)
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .frame(width: 11, height: 10)

              }
            })
            Text("Filter option")
              .font(.custom(Fonts.Mark.medium, size: 18))
            ZStack {

            RoundedRectangle(cornerRadius: 10)
              .foregroundColor(Color.theme.orange)
              .frame(width: 86, height: 37)
              Text("Done")
                .font(.custom(Fonts.Mark.medium, size: 18))
                .foregroundColor(.white)
            }
            }
          }
              .offset(x: geo.size.width * 0.07, y: geo.size.width / 12)
            VStack(spacing:-35) {
            VStack(alignment: .leading, spacing: 12){
            Text("Brand")
              .font(.custom(Fonts.Mark.medium, size: 18))
              ZStack {
                HStack(spacing:200) {
                Text("Samsung")
                    .font(.custom(Fonts.Mark.regular, size: 18))

                  Image("down-arrow")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .scaledToFit()

                    .frame(width: 25, height: 30)

                }
                RoundedRectangle(cornerRadius: 5)
                  .stroke(lineWidth: 0.5)
                  .frame(width: 337, height: 37) }

            }
            .padding(.top , geo.size.width * 0.15)
            .padding(.leading , geo.size.width * 0.05)
              VStack(alignment: .leading, spacing: 12){
            Text("Price")
              .font(.custom(Fonts.Mark.medium, size: 18))
              ZStack {
                HStack(spacing:165) {
                Text("$300 - $500")
                    .padding(.trailing , 10)

                  Image("down-arrow")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .scaledToFit()

                    .frame(width: 25, height: 30)

                }
                RoundedRectangle(cornerRadius: 5)
                  .stroke(lineWidth: 0.5)
                  .frame(width: 337, height: 37) }

            }
            .padding(.top , 50)
            .padding(.leading , geo.size.width * 0.05)
              VStack(alignment: .leading, spacing: 12){
            Text("Size")
              .font(.custom(Fonts.Mark.medium, size: 18))
              .padding(.leading , 5)

              ZStack {
                HStack(spacing:125) {
                Text("4.5 to 5.5 inches")
                    .font(.custom(Fonts.Mark.regular, size: 18))

                    .padding(.trailing , 20)

                  Image("down-arrow")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
                    .scaledToFit()

                    .frame(width: 25, height: 30)

                }
                RoundedRectangle(cornerRadius: 5)
                  .stroke(lineWidth: 0.5)
                  .frame(width: 337, height: 37) }

            }
            .padding(.top , 50)
            .padding(.leading , geo.size.width * 0.05)
            }

            .padding(.leading , geo.size.width * 0.02)
            }



          }

        }
        .onAppear {
                       showTabBar = false
                   }
                   .onDisappear {
                       showTabBar = true
                   }

    }
}

struct NewScreen_Previews: PreviewProvider {
    static var previews: some View {
      NewScreen(showNewScreen: .constant(true), showTabBar: .constant(true))
    }
}
