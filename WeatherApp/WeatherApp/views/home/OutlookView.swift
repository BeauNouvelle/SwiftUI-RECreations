//
//  OutlookView.swift
//  WeatherApp
//
//  Created by Beau Nouvelle on 20/1/2023.
//

import Foundation
import SwiftUI

struct OutlookView: View {

    var body: some View {
        VStack {
            header

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.145, green: 0.165, blue: 0.251))

                HStack {
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                    reading(time: "08:00", icon: "☀️", temp: "7°")
                }
                .padding()
            }
        }
        .fixedSize()
    }

    @ViewBuilder
    var header: some View {
        HStack {
            Text("Today")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.accentColor)
            Spacer()
            NavigationLink {
                WeeklyView()
            } label: {
                HStack {
                    Text("Next 7 days")
                    Image(systemName: "chevron.right")
                }
            }
        }
    }

    func reading(time: String, icon: String, temp: String) -> some View {
        VStack {
            Text(time)
            Text(icon)
                .font(.title)
                .padding(.vertical, 8)
            Text(temp)
        }
        .foregroundColor(.accentColor)
    }

}


