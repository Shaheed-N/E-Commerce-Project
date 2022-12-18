//
//  CartView.swift
//  ProjectApplication
//
//  Created by Shahid on 16.12.22.
//

import SwiftUI
@MainActor class BadMode: ObservableObject {
    @Published var number = 1
}
struct CartView: View {


  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  var width = UIScreen.main.bounds.width
  @EnvironmentObject var viewRouter: ViewRouters

  @Binding var showTabBar: Bool
  @State var data = [Basket]()
  @State var info = OtherViewModel()
  @State var one = ContentViewModel()
  @EnvironmentObject var badg: BadMode
  var body: some View {
    NavigationView {

        ZStack {
        Color.theme.home
      VStack(spacing: 20) {



        Text("My Cart")
          .foregroundColor(.black)
          .font(.custom(Fonts.Mark.bold, size: 35))
          .padding(.trailing ,200)
          ZStack {
            RoundedRectangle(cornerRadius: 30)
          .shadow(color: .gray, radius:20 , y: 5)
          .foregroundColor(Color.theme.blue)


          .frame(width: width * 1, height: 690)

            HStack {
            VStack(spacing: -400) {
            ForEach(data) {

              data in
                GeometryReader { geo in
                  AsyncImage(url: URL(string: "\(data.images)") ,
                         content: { image in
                         image.resizable()
                    .aspectRatio(contentMode: .fit)

                    .cornerRadius(10)

                    .frame(width: 88, height: 88)


                            },
                      placeholder: {

                ProgressView()
                        })
                }

                .padding(.leading , 40)
                .padding(.top , 70)


            }

            }

            }
            VStack(alignment: .leading , spacing: 65) {
            ForEach(data) { title in

                VStack(alignment: .leading , spacing:5) {
                  if title.title.count > 9 {
                  ZStack {



                    Text(title.title)
                      .foregroundColor(.white)

                      .frame(width: 120, height: 60)


                  }
                  .padding(.trailing , 70)
                  }
                  else {
                    Text(title.title)
                      .foregroundColor(.white)

                  }

                  Text("\(title.price)")
                  .foregroundColor(Color.theme.orange)
            }
              .font(.custom(Fonts.Mark.medium, size: 20))
            }

            }

            .padding(.top ,-280)
            .padding(.leading ,70)
            VStack(spacing: 70) {
              ForEach(0..<2 , id: \.self) { _ in
               HStack(spacing: 20) {
              ZStack {
                RoundedRectangle(cornerRadius: 26)
                  .frame(width: 26, height: 68)
                  .foregroundColor(Color.theme.rounded)

                VStack(spacing: 5){
                  Image(systemName: "minus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 9)
                  Text("1")

                    Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 9)


                }
                .foregroundColor(.white)


              }
                Image("trash")

               }

              }

            }

            .padding(.top , -270)
            .padding(.leading ,250)
            VStack(spacing: 25) {
            VStack(spacing: 15) {
            Rectangle()
              .frame(width: 400, height: 2)
              .foregroundColor(.white)
              .opacity(0.2)
            HStack(spacing: 160) {

              VStack(alignment: .leading, spacing: 10) {
              Text("Total")

              Text("Delivery")
            }
            .foregroundColor(.white)
              VStack(alignment: .leading , spacing : 10) {
                Text("$\(info.total) us")
                  .foregroundColor(.white)
              Text(info.delivery)
                .foregroundColor(.white)

              }

              }
            .onAppear  {
                  info.fetchData()
            }

            }
              VStack(spacing: 30) {
            Rectangle()
              .frame(width: 400, height: 2)
              .foregroundColor(.white)
              .opacity(0.2)

            ZStack {

RoundedRectangle(cornerRadius: 10)
              .frame(width: 326, height: 54)
              .foregroundColor(Color.theme.orange)
              Text("Checkout")
                .font(.custom(Fonts.Mark.bold, size: 20))
                .foregroundColor(.white)
            }

              }

            }
            .padding(.top , 400)

          }


        }
        .navigationBarTitle("")
                    .navigationBarBackButtonHidden(true)

        .onAppear() {
    BasketApi().loadData { (result) in
      self.data = result.basket
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

    }


}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
      CartView(showTabBar: .constant(true))
        .environmentObject(BadMode())
        .environmentObject(ViewRouters())


    }
}



