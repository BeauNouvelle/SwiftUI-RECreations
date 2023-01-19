//
//  HomeView.swift
//  WeatherApp
//
//  Created by Beau Nouvelle on 20/1/2023.
//

import SwiftUI

struct HomeView: View {

    @State var sliderValue: Double = 0

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                    .padding(.bottom)

                ScrollView {
                    OutlookView()
                        .padding()
                    DetailsView()

                    Slider(value: $sliderValue)
                    Text("\(sliderValue)")
                        .foregroundColor(.accentColor)

                    SunPathView(sun: sliderValue)
                }
            }
            .padding()
            .background(Color(red: 0.086, green: 0.11, blue: 0.212))
        }
    }
}

struct SunPathView: View {

    var sun: Double

    var body: some View {
        VStack(alignment: .center, spacing: 0) {

            ZStack {
                HStack {
                    Text("Sun")
                        .font(.title)
                    Spacer()
                }

                GeometryReader { geometry in
                    ZStack {
                        Path { path in

                            path.addArc(center: CGPoint(x: geometry.size.width/2, y: geometry.size.width/2),
                                        radius: geometry.size.width/2,
                                        startAngle: Angle(degrees: 0),
                                        endAngle: Angle(degrees: 180),
                                        clockwise: true)
                        }
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [10, 10]))
                        .offset(y: geometry.size.height/2)
                        InnerRing(pct: sun)
                            .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                            .scaleEffect(y: -1)
                            .offset(y: geometry.size.height/2)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .padding(.horizontal)
            }

            Rectangle().frame(height: 1)

            HStack {
                Text("8:01 am")
                Spacer()
                Text("3:52 pm")
            }
            .font(.caption)
        }
        .foregroundColor(.accentColor)
    }

}

struct InnerRing : Shape {
    var lagAmmount = 0.001
    var pct: Double

    func path(in rect: CGRect) -> Path {

        let end = pct * 180
        var start: Double = pct - 10

        if pct > (1 - lagAmmount) {
            start = 180 * (2 * pct - 1.0)
        } else if pct > lagAmmount {
            start = 180 * (pct - lagAmmount)
        } else {
            start = 0
        }

        var p = Path()

        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: start),
                 endAngle: Angle(degrees: end),
                 clockwise: false)
        return p
    }

    var animatableData: Double {
        get { return pct }
        set { pct = newValue }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
