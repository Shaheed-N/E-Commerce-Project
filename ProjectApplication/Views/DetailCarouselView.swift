//
//  DetailCarouselView.swift
//  ProjectApplication
//
//  Created by Shahid on 15.12.22.
//

import SwiftUI
import ACarousel
struct DetailCarouselView: View {
  var width = UIScreen.main.bounds.width
  @State private var showing = false

  @StateObject var viewRouter = ViewRouters()
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @Binding var showTabBar: Bool

  let items: [Item] = roles.map { Item(image: Image($0)) }
  @StateObject var vm = CaroueselViewModel()

  var body: some View {
    
    NavigationView {
      
      
    ZStack {


      Color.theme.home


      GeometryReader { geo in
        ACarousel(items,
                spacing: 50,
                headspace: 35,
                sidesScaling: 0.7,
                isWrap: true
            ) { item in
        item.image
          .resizable()

          .frame(width: geo.size.width / 1.5)

          .frame(height: 335)
          .cornerRadius(20)
          .shadow(color: .gray, radius: 1.9)

      }

            .padding(.top , width * -1)


        ZStack {
            RoundedRectangle(cornerRadius: 30)
          .shadow(color: .gray, radius:20 , y: 5)
          .foregroundColor(.white)

          .frame(width: geo.size.width * 1, height: 471)
          VStack(spacing: 30) {
          HStack(spacing: 60) {
            VStack(alignment: .leading , spacing: 10) {

        Text("Galaxy Note 20 Ultra")
          .font(.custom(Fonts.Mark.medium, size: 24))
              HStack { ForEach(0..<5) { _ in
                  Image(systemName: "star.fill")
                  .foregroundColor(.yellow)
              }

            }
            }
            ZStack {
              
              RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.theme
                  .blue)
                .frame(width: 37, height: 33)
              Image(systemName: "heart")
                .foregroundColor(.white)
                .frame(width: 14, height: 13)

            }
            .padding(.top , -20)
          }


            HStack(spacing: 57) {
              VStack(alignment: .center , spacing:  5) {
                Text("Shop")
                .font(.custom(Fonts.Mark.bold, size: 20))
                RoundedRectangle(cornerRadius: 20)
                  .frame(width: 86, height: 3)
                  .foregroundColor(Color.theme.orange)

              }
            Text("Details")
                .font(.custom(Fonts.Mark.regular, size: 20))
                .foregroundColor(.gray)
            Text("Features")
                .font(.custom(Fonts.Mark.regular, size: 20))
                .foregroundColor(.gray)

            }
            HStack(spacing: 50) {
                VStack {
                Image("cpu")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 28, height: 28)
                  Text(vm.cpu)
                    .font(.custom(Fonts.Mark.regular, size: 11))
                    .foregroundColor(.gray)

                }
              VStack {
              Image("camera")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                Text(vm.camera)
                  .font(.custom(Fonts.Mark.regular, size: 11))
                  .foregroundColor(.gray)

              }
              VStack {
              Image("sd")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                Text(vm.sd)
                  .font(.custom(Fonts.Mark.regular, size: 11))
                  .foregroundColor(.gray)

              }
              VStack {
              Image("ssd")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                Text(vm.ssd)
                  .font(.custom(Fonts.Mark.regular, size: 11))
                  .foregroundColor(.gray)

              }

          }
            VStack(alignment: .leading) {
            Text("Select color and capacity")
            HStack(spacing: 50) {
            HStack(spacing: 20) {
              ZStack {
                Circle()
                  .frame(width: 39, height: 39)
                  .foregroundColor(Color.theme.brown)
                Image(systemName: "checkmark")
                  .foregroundColor(.white)
              }
                Circle()
                  .frame(width: 39, height: 39)
                  .foregroundColor(Color.theme.blue)

            }
              HStack(spacing: 40) {
              ZStack {
RoundedRectangle(cornerRadius: 10)                  .frame(width: 71, height: 30)
                  .foregroundColor(Color.theme.orange)
            Text("128 GB")
                  .font(.custom(Fonts.Mark.bold, size: 13))
                  .foregroundColor(.white)
              }


            Text("256 GB")
                  .font(.custom(Fonts.Mark.bold, size: 13))
                  .foregroundColor(.gray)


              }
              
            }
            .offset(x: -10)

            }

            Button(action: {
              showing = true

            }) {


            ZStack {
              RoundedRectangle(cornerRadius: 10)
                            .frame(width: 355, height: 54)
                            .foregroundColor(Color.theme.orange)


          HStack(spacing: 60) {


                Text("Add to Cart")

                Text("$,1500.00")

              }
              .foregroundColor(.white)
              .font(.custom(Fonts.Mark.bold, size: 20))

            }
            .sheet(isPresented: $showing,
                     onDismiss: { print("dismissed!") },
                   content: { Action(showTabBar: $showTabBar) })

                   }
            
            
        }






      }
        .padding(.top , 380)

    }
      .padding(.top , -30)

    }
    

    .edgesIgnoringSafeArea(.all)
    }


    .onAppear {
                   showTabBar = false
               }
               .onDisappear {
                   showTabBar = true
               }
    
  }
}

struct DetailCarouselView_Previews: PreviewProvider {
    static var previews: some View {
      DetailCarouselView(showTabBar: .constant(true))
        .environmentObject(ViewRouters())
      
    }
}
struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

let roles = ["ori", "samsung"]



struct Action: View {
  @Binding var showTabBar: Bool

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
      VStack {
        HStack(spacing:50) {
        Button(action: {            presentationMode.wrappedValue.dismiss()
 }) {
   HStack {
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
 }
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
            .offset(y:10)
            .offset(x: 40)

      }

        }

        CartView(showTabBar: $showTabBar)



      }
    }
}
