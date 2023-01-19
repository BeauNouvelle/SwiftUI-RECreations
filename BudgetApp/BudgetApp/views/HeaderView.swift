//
//  HeaderView.swift
//  BudgetApp
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI

struct HeaderView: View {

    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "line.3.horizontal")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            .foregroundColor(.secondary)

            Spacer()
            Text("My Spending")
                .font(.headline)
            Spacer()


            Button {

            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            .foregroundColor(.secondary)
        }
    }
}
