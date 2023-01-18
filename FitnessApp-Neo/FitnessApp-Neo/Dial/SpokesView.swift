//
//  SpokesView.swift
//  FitnessApp-Neo
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI

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
