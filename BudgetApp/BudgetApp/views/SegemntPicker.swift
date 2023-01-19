//
//  SegemntPicker.swift
//  BudgetApp
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI

struct SegementedPicker: View {

    @Binding var selected: String
    let options: [String]
    @Namespace var underline

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 30) {
                ForEach(options, id: \.self) { option in
                    VStack {
                        Button {
                            withAnimation {
                                selected = option
                            }
                        } label: {
                            VStack(alignment: .leading) {
                                Text(option)
                                    .foregroundColor(selected == option ? .primary : .secondary)
                            }
                        }

                        ZStack {
                            Rectangle().fill(Color.primary)
                                .frame(height: 1)
                                .opacity(0)

                            if selected == option {
                                Rectangle().fill(Color.primary)
                                    .frame(height: 1)
                                    .matchedGeometryEffect(id: "option", in: underline)
                            }
                        }

                    }
                    .fixedSize()
                }
            }
            Rectangle().frame(height: 1).foregroundStyle(Color.secondary.opacity(0.2))
                .offset(y: -9)
        }
    }

}
