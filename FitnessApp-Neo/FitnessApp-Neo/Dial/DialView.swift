//
//  DialView.swift
//  FitnessApp-Neo
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import SwiftUI

struct DialView: View {
    var body: some View {
        VStack {
            DialHeaderView(name: "Jessica", image: "profile")
                .padding()

            Dial(goal: 10_000, steps: 7_540)
                .padding()
            Spacer()
        }
        .padding()
        .background(Color.backgroundGray)
    }
}


struct Dial: View {

    let goal: Int
    let steps: Int

    var body: some View {
        ZStack {

            SpokesView()
            CircleView()

            ZStack {
                CircleView()

                Circle().stroke(style: StrokeStyle(lineWidth: 12))
                    .padding(20)
                    .foregroundColor(.foregroundGray)
                Circle().stroke(style: StrokeStyle(lineWidth: 12))
                    .padding(20)

                VStack {
                    Text("Goal: \(goal)")
                    Text("\(steps)")
                        .font(.title)
                        .bold()
                        .padding()
                    Text("Steps")
                }
            }
            .padding()


        }
        .foregroundColor(.accentColor)
    }

}

struct SpokesView: View {

    var body: some View {
        ForEach(0..<360, id: \.self) { index in
            if (Double(index).truncatingRemainder(dividingBy: 2.25) == 0) {

                Rectangle()
                    .frame(width: 1)
                    .rotationEffect(.degrees(Double(index)))
            }
        }
    }
}

struct CircleView: View {

    private let shadowOffset: CGFloat = 8
    private let shadowRadius: CGFloat = 9
    private let shadowColor: Color = Color(red: 0.871, green: 0.871, blue: 0.871)
    private let highlightColor: Color = .white

    var body: some View {
        Circle().fill(Color.backgroundGray)
            .shadow(color: shadowColor, radius: shadowRadius, x: shadowOffset, y: shadowOffset)
            .shadow(color: highlightColor, radius: shadowRadius, x: -shadowOffset, y: -shadowOffset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}

extension Color {

    static let backgroundGray = Color(red: 0.922, green: 0.925, blue: 0.941)
    static let foregroundGray = Color(red: 0.871, green: 0.871, blue: 0.871)
}
