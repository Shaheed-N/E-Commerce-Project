//
//  csdf.swift
//  fdsf
//
//  Created by Shahid on 17.12.22.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedIndex : Int
    @Binding var showMyLibraryView: Bool
  @StateObject var vm = ContentViewModel()
  @StateObject var badgeData = BadMode()
  



    var body: some View {
      VStack {
        if selectedIndex == 0 {
        Button(action: {          vm.newScreen.toggle()
        } , label: {

          Image("filter")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
        })
        .offset(x: 140, y: 15)
        GeometryReader { geo in
          if UIScreen.main.bounds.width < 400 {
            NewScreen(showNewScreen: $vm.newScreen, showTabBar: .constant(true))
              .padding(.top, geo.size.width * 0.6)
            .offset(x: geo.size.width * 0.01)

              .offset(y: vm.newScreen ? 0 : UIScreen.main.bounds.height)
          }
          else {
            NewScreen(showNewScreen: $vm.newScreen, showTabBar: .constant(true))
              .padding(.top, geo.size.width * 1)
              .offset(x: geo.size.width * -0.002)

                  .offset(y: vm.newScreen ? 0 : UIScreen.main.bounds.height)

          }

        }
        }
        else {
          
        }
        if vm.newScreen || selectedIndex == 1 {

        }
        else {

        VStack {
          HStack {
          
            Button(action: {
                        if selectedIndex == 4 {
                            showMyLibraryView = true
                        } else {
                            selectedIndex = 0
                        }
                    }, label: {
                      HStack(spacing: -20)  {
                            Image("circle")
                          .renderingMode(.template)

                                .font(.system(size: 18))
                                .offset(x: -25)

                                .foregroundColor(selectedIndex == 0 ? Color(.white) : .gray)
                                .scaledToFit()

                        Text("Explorer")
                          .foregroundColor(.white)
                          .font(.custom(Fonts.Mark.bold, size: 15))
                          .font(.system(size: 15))
                                .font(.custom(Fonts.Mark.bold, size: 15))
                                .foregroundColor(selectedIndex == 0 ? Color(.white) : .gray)
                        }

                        Spacer()
                    })
            .offset(x: -25)


            Button(action: {
                        if selectedIndex == 4 {
                            showMyLibraryView = true
                        } else {
                            selectedIndex = 1
                        }
                    }, label: {
                      ZStack {
                      ZStack {

                        Circle()
                          .foregroundColor(Color.theme.orange)
                          .frame(width: 20, height: 20)
                        Text("\(badgeData.number)")
                          .foregroundColor(.white)
                          .font(.custom(Fonts.Mark.bold, size: 15))


                      }
                      .padding(.trailing, 20)
                      .padding(.top, -20)




                      HStack(spacing: -21)  {
                            Image("bag")
                          .renderingMode(.template)
                                .font(.system(size: 18))
                                .offset(x: -5)


                                .foregroundColor(selectedIndex == 1 ? Color(.white) : .gray)
                                .scaledToFit()
                        Spacer()


                          .font(.system(size: 15))
                                .font(.custom(Fonts.Mark.bold, size: 15))
                                .foregroundColor(selectedIndex == 1 ? Color(.white) : .gray)
                        }
                      }
                        Spacer()
                    })
            
            Button(action: {
                        if selectedIndex == 4 {
                            showMyLibraryView = true
                        } else {
                            selectedIndex = 2
                        }
                    }, label: {
                      HStack(spacing: -21)  {
                            Image("heart")
                          .renderingMode(.template)
                                .font(.system(size: 18))
                                .offset(x: -5)


                                .foregroundColor(selectedIndex == 2 ? Color(.white) : .gray)
                                .scaledToFit()


                          .font(.system(size: 15))
                                .font(.custom(Fonts.Mark.bold, size: 15))
                                .foregroundColor(selectedIndex == 2 ? Color(.white) : .gray)
                        }

                        Spacer()
                    })
            Button(action: {
                        if selectedIndex == 4 {
                            showMyLibraryView = true
                        } else {
                            selectedIndex = 3
                        }
                    }, label: {
                      HStack(spacing: -21)  {
                            Image("person")
                          .renderingMode(.template)
                                .font(.system(size: 18))
                                .offset(x: -5)



                                .foregroundColor(selectedIndex == 3 ? Color(.white) : .gray)
                                .scaledToFit()
                        Spacer()


                          .font(.system(size: 15))
                                .font(.custom(Fonts.Mark.bold, size: 15))
                                .foregroundColor(selectedIndex == 2 ? Color(.white) : .gray)
                        }

                        Spacer()
                      
                    })
            
                }
          .environmentObject(badgeData)



          .padding(.horizontal , 40)


            .ignoresSafeArea()
            .frame(height: 70)
          
          
        }
        .padding(.leading , 60)
        .offset(x: 30, y: 0)

      

        .background(Color.theme.blue)
        .cornerRadius(30)

      }
      
    }
    }


    }


struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
      CustomTabBarView(selectedIndex: .constant(2), showMyLibraryView: .constant(false))
        .environmentObject(BadMode())
    }
}

