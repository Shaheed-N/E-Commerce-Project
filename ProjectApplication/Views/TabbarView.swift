//
//  TabbarView.swift
//  ProjectApplication
//
//  Created by Shahid on 14.12.22.
//

import SwiftUI

  struct TabbarView: View {

    @StateObject var viewRouter: ViewRouter
    @StateObject var vm = ContentViewModel()
    @State var show = false
    @StateObject var badgeData = BadMode()

    @State private var showTabBar = true

    var body: some View {
      
        ZStack {

          Color.theme.home
          GeometryReader { geometry in
              VStack {
                  switch viewRouter.currentPage {
                  case .home:
                    HomeView(showTabBar: $showTabBar)
                  case .bag:
                    CartView(showTabBar: $showTabBar)
                      .padding(.top , 80)
                    
                  case .favorite:
                  Text("A")
                  case .user:
                    Text("A")

                  }
              if viewRouter.currentPage == .bag {

              }


                else {
                  
                ZStack {
              RoundedRectangle(cornerRadius: 30).frame(width: geometry.size.width / 0.99, height: 72) .foregroundColor(Color.theme.blue)
              .padding(.top , -70)
              HStack {
              TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/98, systemIconName: "circle.fill", tabName: "Explorer")
                  .offset(x: 20, y: 5)
                if badgeData.number != 0 {
                  ZStack {
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .bag, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName:
                        "bag", tabName: "")
                    ZStack {

                      Circle()
                        .foregroundColor(Color.theme.orange)
                        .frame(width: 20, height: 20)
                      Text("\(badgeData.number)")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Mark.bold, size: 15))


                  }
                    
                    .padding(.top , -50)


                  }
                }
                else {
                  TabBarIcon(viewRouter: viewRouter, assignedPage: .bag, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName:
                      "bag", tabName: "")
                }
                

              TabBarIcon(viewRouter: viewRouter, assignedPage: .favorite, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "suit.heart", tabName: "")
                  .padding(.leading , 20)
              TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/3, height: geometry.size.height/30, systemIconName: "person", tabName: "")
              }
                  

              .environmentObject(badgeData)

              .padding(.leading , 30)
              .padding(.top , -5)
                  

                  }
                  
                }




              }



          }
          .edgesIgnoringSafeArea(.all)
          

        }
      

      }

  }


  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
        TabbarView(viewRouter: ViewRouter()).environmentObject(BadMode())
      }
  }

  struct TabBarIcon: View {

      @StateObject var viewRouter: ViewRouter
      let assignedPage: Page

      let width, height: CGFloat
      let systemIconName, tabName: String

      var body: some View {
        HStack(spacing: 35) {
              Image(systemName: systemIconName)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: width / 1.2, height: height / 1.5)
                  .padding(.top, -40)
              Text(tabName)
            .font(.custom(Fonts.Mark.bold, size: 15))
            .offset(x: -55 , y: -37)
          }
              .padding(.horizontal, -25)
              .onTapGesture {
                  viewRouter.currentPage = assignedPage
              }
              .foregroundColor(viewRouter.currentPage == assignedPage ? Color.white
                  : .gray)
      }
  }

