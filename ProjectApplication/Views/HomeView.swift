//
//  HomeView.swift
//  ProjectApp
//
//  Created by Shahid on 09.12.22.
//

import SwiftUI

struct HomeView: View {
  @State private var showing = false

  @State var select: Categories = all.first!
  @State var text: String = ""
  @StateObject var vm = ContentViewModel()

  var width = UIScreen.main.bounds.width
  var columns = [

    GridItem(spacing: 0),
    GridItem(spacing: 0)
    ]
  @Binding var showTabBar: Bool
  @State var new = true
  @State var data = [BestSeller]()
  @State var tap = false
  @State private var alignment = TextAlignment.leading
  var body: some View {
    NavigationView {

      ZStack {


        Color.theme.home

      VStack(spacing: 30) {



        ScrollView(.vertical , showsIndicators: false) {

        VStack(spacing: 20) {


        HStack(spacing: 90){
          Text("Select Category")
            .font(.custom(Fonts.Mark.heavy, size: 25))
          Text("view all")
            .font(.custom(Fonts.Mark.regular, size: 15))
            .foregroundColor(Color.theme.orange)

        }

        .padding(.trailing , 15)


        ScrollView(.horizontal , showsIndicators: false , content: {

          HStack(spacing: 15) {

          ForEach(all) { i in
            VStack {
            ZStack {
              Circle()
                .frame(width: 71, height:71)
                .foregroundColor(select.id == i.id ? Color.theme.orange: Color.white)
              Image(i.category)
                .renderingMode(.template)
                .foregroundColor(select.id == i.id ? .white : .gray)

            }
              Text(i.text)
                .font(.custom(Fonts.Mark.medium, size: 12))
                .foregroundColor(select.id == i.id ? Color.theme.orange : .black)
            }
            .onTapGesture {
              withAnimation(.spring()) {
                select = i
              }
            }

          }
          }
          })


        .padding(.leading , 35)
        .padding(.top , 5)
        HStack {
        ZStack {
          GeometryReader { geo in
        RoundedRectangle(cornerRadius: 50)
        .fill(Color.white)
        .frame(width: geo.size.width * 1.8, height: 34)

          HStack(spacing: 190) {
          HStack(spacing:18) {
          Text("Search")
          .font(.custom(Fonts.Mark.regular, size: 12))
          .foregroundColor(.gray)
          }
          .offset(x:geo.size.width * 0.1 , y:geo.size.width * 0.06)
          }




          }


        }
        .padding(.leading ,40)
        .padding(.top ,30)
          GeometryReader { geo in
          ZStack {

          Circle()
            .frame(width: 34, height: 34)
            .foregroundColor(Color.theme.orange)
            Image("Group")

        }
          .padding(.top , 30)
          .offset(x: geo.size.width * 0.65)

          }
        }
        .padding(.top , -10)

        HStack(spacing: width / 2) {
        Text("Hot sales")
              .font(.custom(Fonts.Mark.sfbolds, size: 25))
          Text("see more")
            .font(.custom(Fonts.Mark.regular, size: 15))
            .foregroundColor(Color.theme.orange)

        }

        .padding(.top , width / 14)
        .padding(.leading , width * 0.01)
          CarouselView()
            .padding(.top , width * -0.02)
          GeometryReader { geo in
            VStack(spacing:20) {

          HStack(spacing: geo.size.width * 0.47) {
        Text("Best Seller")
              .font(.custom(Fonts.Mark.sfbolds, size: 25))
          Text("see more")
            .font(.custom(Fonts.Mark.regular, size: 15))
            .foregroundColor(Color.theme.orange)

        }
          .padding(.top , -5)
        .padding(.leading , geo.size
          .width * 0.02)
              LazyVGrid(columns: columns, spacing: geo.size.width * 0.03) {


              ForEach(data) { data in

                Button(action: {
                  showing = true

                }) {




                  AsyncImage(url: URL(string: "\(data.picture)") ,
                      content: { image in
                  ZStack {
                    RoundedRectangle(cornerRadius: 10)
                      .frame(width: geo.size.width / 2.2, height: 250)
                      .foregroundColor(.white)
                      .padding(.top , 80)
                      .padding(.leading , 5)

                      image.resizable()

              .aspectRatio(contentMode: .fill)
              .frame(width: geo.size.width / 3.6, height: 168)

              .cornerRadius(14)
              .clipped()
              .offset(x: 0,y: 10)


                    if data.isFavorites == new {
                      ZStack {

                        Circle()
                          .frame(width: 25, height: 25)
                          .foregroundColor(.white)
                          .shadow(color: .gray, radius: 20)
                        Image(systemName: "suit.heart.fill")
                          .resizable()
                          .renderingMode(.template)
                          .foregroundColor(Color.theme.orange)
                          .frame(width: 11, height: 10)




                    }

                      .offset(x: 70, y: -60)


                    }
                    else {
                    ZStack {

                      Circle()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                      Image(systemName: "suit.heart.fill")
                        .renderingMode(.template)
                        .foregroundColor(Color.theme.orange)

                    }
                    }
                    VStack(alignment: .leading, spacing: 5) {
                      if (data.title.count > 16) {
                    HStack {
                    Text("$\(data.priceWithoutDiscount)")
                      .font(.custom(Fonts.Mark.bold, size: 16))
                      .foregroundColor(.black)


                      Text("\(data.discountPrice)")



                        .font(.custom(Fonts.Mark.medium, size: 10))
                        .foregroundColor(.gray)
                        .strikethrough()

                    }
                        Text("\(data.title)")
                        .font(.custom(Fonts.Mark.regular, size: 10))
                        .padding(.trailing ,20)
                        .foregroundColor(.black)


                                          }
                      else {
                        HStack {
                        Text("$\(data.priceWithoutDiscount)")
                          .font(.custom(Fonts.Mark.bold, size: 16))
                          .foregroundColor(.black)


                          Text("\(data.discountPrice)")
                            .foregroundColor(.black)



                            .font(.custom(Fonts.Mark.medium, size: 10))
                            .foregroundColor(.gray)
                            .strikethrough()

                        }
                        Text("\(data.title)")
                            .font(.custom(Fonts.Mark.regular, size: 10))
                            .padding(.trailing ,50)
                            .foregroundColor(.black)


                      }


                    }



                    .padding(.top , 240)




                }
                  .padding(.top , -80)



                },
                placeholder: {
                ZStack {
                 ActivityIndicator()
                  RoundedRectangle(cornerRadius: 10)
                  .frame(width: 181, height: 227)
                  .foregroundColor(.gray)
                  .opacity(0.5)

                }

                }

                  )

                }
                .sheet(isPresented: $showing,
                         onDismiss: { print("dismissed!") },
                       content: { Popover(showTabBar: $showTabBar) })




              }

              }

            } .onAppear() {
              APIHelper().loadData { (result) in
              self.data = result.bestSeller
              }

          }




            }


          }
          if UIScreen.main.bounds.width < 400 {
          RoundedRectangle(cornerRadius: 20)
            .frame(height: width * 1.62)
            .hidden()
          }
          else {
            RoundedRectangle(cornerRadius: 20)
              .frame(height: width * 1.52)
              .hidden()
          }


        }
        .padding(.top , 105)


        }
      .navigationBarTitle("")
      .navigationBarHidden(true)

        HeaderView()

      }



      }
    .padding(.top , -90)


  }

      }









struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(showTabBar: .constant(true))


    }
}

struct Popover: View {
  @Binding var showTabBar: Bool

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
      VStack {
        HStack(spacing:50) {
        Button(action: {            presentationMode.wrappedValue.dismiss()
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
          HStack(spacing: 70) {

            HStack(spacing: 10) {


        Text("Product Details")
          .font(.custom(Fonts.Mark.medium, size: 18))
        ZStack {

        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(Color.theme.orange)
          .frame(width: 37, height: 37)
          Image(systemName: "bag")
            .foregroundColor(.white)
            .frame(width: 13, height: 14)
        }
        }
            .offset(y: 7)
            .offset(x: 30)

      }

        }



        DetailCarouselView(showTabBar: $showTabBar)
      }
    }
}
