//
//  Dial.swift
//  FitnessApp-Neo
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI

struct Dial: View {

    let goal: Int
    let steps: Int

    var body: some View {
        ZStack {
            SpokesView()
                .padding(40)
            CircleView()

            ZStack {
                CircleView()

                Circle().stroke(style: StrokeStyle(lineWidth: 12))
                    .padding(20)
                    .foregroundColor(.foregroundGray)

                Circle()
                    .trim(from: 0, to: (CGFloat(steps) / CGFloat(goal)))
                    .scale(x: -1)
                    .rotation(.degrees(90))
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .butt))
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
