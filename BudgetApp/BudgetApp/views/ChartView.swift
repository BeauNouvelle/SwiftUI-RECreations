//
//  ChartView.swift
//  BudgetApp
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI
import Charts

struct ChartView: View {

    let data: [SavingsDataPoint]

    var body: some View {
        VStack {
            Chart {
                ForEach(Array(data.enumerated()), id: \.offset) { index, element in
                    BarMark(x: .value("month", element.month), y: .value("value", element.value))
                        .foregroundStyle(index % 2 == 0 ? Color.lightBar : Color.darkBar)
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisValueLabel()
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic) { value in
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            if intValue < 1000 {
                                Text("\(intValue)")
                                    .font(.body)
                            } else {
                                Text("\(intValue/1000)\(intValue == 0 ? "" : "k")")
                                    .font(.body)
                            }
                        }
                    }
                }
            }
        }
    }

}
