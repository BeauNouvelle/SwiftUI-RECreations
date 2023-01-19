//
//  DetailsView.swift
//  WeatherApp
//
//  Created by Beau Nouvelle on 20/1/2023.
//

import Foundation
import SwiftUI

struct DetailsView: View {

    var body: some View {
        HStack() {
            Spacer()
            detailItem
            Spacer()
            detailItem
            Spacer()
            detailItem
            Spacer()
        }
        .foregroundColor(.accentColor)
    }

    var detailItem: some View {
        VStack {
            Text("👁️")
                .font(.title)
                .padding(30)
                .background(Color(red: 0.145, green: 0.165, blue: 0.251).clipShape(RoundedRectangle(cornerRadius: 20)))
            Text("Visibility\n16km")
                .multilineTextAlignment(.center)
        }
    }

}
