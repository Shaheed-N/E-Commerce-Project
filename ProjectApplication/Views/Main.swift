//
//  Main.swift
//  ProjectApplication
//
//  Created by Shahid on 17.12.22.
//

import SwiftUI

struct Main: View {
  @State var selectedIndex = 0
  @StateObject var viewRouter = ViewRouters()

  @StateObject var vm = ContentViewModel()
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @Binding var showTabBar: Bool

  


  var body: some View {

      ZStack {

          if selectedIndex == 0 {
            HomeView(showTabBar: $showTabBar)

          } else if selectedIndex == 1 {
            MotherView(showTabBar: $showTabBar)
              .environmentObject(viewRouter)


          } else if selectedIndex == 2 {
              Text("Favorite")
          } else if selectedIndex == 3 {
              Text("User Profile")
          }
        
          if showTabBar {
              VStack {
                  Spacer()
                CustomTabBarView(selectedIndex: $selectedIndex, showMyLibraryView: .constant(true))
              }
          }
        
      }
  }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
      Main(showTabBar: .constant(true))
        .environmentObject(ViewRouter())
    }
}
