//
//  SplashView.swift
//  ProjectApp
//
//  Created by Shahid on 09.12.22.
//

import SwiftUI

struct SplashView: View {
  @State var selectedIndex = 0
  @State private var showTabBar = true
  @State static var value = ""
  @State var isActive : Bool = false
  @State private var size = 0.8
  @State private var opacity = 0.5
  var body: some View {
              if isActive {
                Main(showTabBar: $showTabBar)

              } else {
                  ZStack {

                    Color.theme.blue
                    .edgesIgnoringSafeArea(.all)

                      ZStack {
                        Circle()
                          .frame(width: 132, height: 130)
                          .foregroundColor(Color.theme.orange)
                      }
                      .scaleEffect(size)
                      .opacity(opacity)
                      .onAppear {
                          withAnimation(.easeIn(duration: 1.2)) {
                              self.size = 0.9
                              self.opacity = 1.00
                          }
                      }

                  .onAppear {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                          withAnimation {
                              self.isActive = true
                          }
                      }
                  }
                    Text("Ecommerce \nConcept")

                      .font(.custom(Fonts.Mark.heavy, size: 25))
                      .foregroundColor(.white)

            }
        }
      }
      }
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
