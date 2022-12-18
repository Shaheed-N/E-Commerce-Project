//
//  CarouselView.swift
//  ProjectApplication
//
//  Created by Shahid on 12.12.22.
//

import SwiftUI

struct CarouselView: View {
  @State var data = [HomeStore]()
  @State var new = true


  var body: some View {

        HStack(spacing: 1) {
          TabView {


        ForEach(data) {
          
          data in
          ZStack {
            GeometryReader { geo in
          AsyncImage(url: URL(string: "\(data.picture)") ,
                     content: { image in
                     image.resizable()
                .aspectRatio(contentMode: .fit)
                
                .cornerRadius(10)

                .frame(width: geo.size.width * 0.95, height: 182)


                        },
                  placeholder: {
            ZStack {
              GeometryReader { geo in
              ActivityIndicator()
                  .offset(x: geo.size.width * 0.34, y: geo.size.width * 0.13)
              RoundedRectangle(cornerRadius: 10)
                  .frame(width: geo.size.width * 0.95, height: 182)
                .foregroundColor(.gray)
                .opacity(0.5)

              }
            }
                })
          .padding(.leading ,10)

            }
            if data.isNew == new {
            GeometryReader { geo in

            ZStack {
            Circle()
              .foregroundColor(Color.theme.orange)
              .frame(width: 27, height: 27)
              Text("New")
                .font(.custom(Fonts.Mark.bold, size: 10))
                .foregroundColor(.white)

            }
            .offset(x: geo.size.width * 0.09, y: geo.size.width * 0.1)

              }
            }
            else {
              Text("")
            }
            VStack(spacing: 20) {
              VStack(spacing: 5) {
            Text("\(data.title)")
                .font(.custom(Fonts.Mark.bold, size: 25))
            Text("\(data.subtitle)")
                .font(.custom(Fonts.Mark.regular, size: 11))

            }
                .foregroundColor(.white)
              if data.isBuy == new {
                ZStack {
                  RoundedRectangle(cornerRadius: 5)
                    .frame(width: 98, height: 23)
                    .foregroundColor(.white)
                Text("Buy now!")
                    .font(.custom(Fonts.Mark.bold, size: 11))

                }
              }
              else {
                Text("")
              }
            }
            .padding(.trailing ,200)





          }


        }


        }

    }


        .frame(width: 378, height: 182)

    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))




      .onAppear() {
        APIHelper().loadData { (result) in
        self.data = result.homeStore
        }

      }

    }
}
struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
      CarouselView()
        .previewLayout(.sizeThatFits)
    }
}
struct ActivityIndicator: View {

    @State var degress = 0.0

    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(Color.theme.blue, lineWidth: 9.0)
            .frame(width: 80, height: 80)
            .rotationEffect(Angle(degrees: degress))
            .onAppear(perform: {self.start()})
    }

    func start() {
        _ = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
            withAnimation {
                self.degress += 10.0
            }
            if self.degress == 360.0 {
                self.degress = 0.0
            }
        }
    }
}
