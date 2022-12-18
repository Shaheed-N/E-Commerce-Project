//
//  Tabbar.swift
//  ProjectApplication
//
//  Created by Shahid on 14.12.22.
//

import SwiftUI
import TabBar
struct Tabbar: View {

     var body: some View {
       
       TabView {
         
                HomeView()
                      .tabItem {
                          Image(systemName: "1.circle.fill")
                          Text("")
                      }
     }
 }
}


struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}

struct CustomTabBarStyle: TabBarStyle {

    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
      ZStack {

        RoundedRectangle(cornerRadius: 30)
          .frame(width: 414, height: 72)
        
        
          .foregroundColor(Color.theme.blue)
        itemsContainer()
        .background(Color.theme.blue)
            .cornerRadius(30)
            .frame(width: 414, height: 72)


        


      }
    }

}
struct CustomTabItemStyle: TabItemStyle {

    public func tabItem(icon: String, title: String, isSelected: Bool) -> some View {
        ZStack {

            if isSelected {
Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(.white)
                .padding(.trailing , 50)
            }

          
          Text("Explorer")

            .foregroundColor(.white)
                      Image(systemName: icon)
            .foregroundColor(isSelected ? .white : Color.white)
                .frame(width: 32.0, height: 32.0)

        }
        .padding(.vertical, 8.0)
    }

}
