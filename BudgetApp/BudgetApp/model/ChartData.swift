//
//  ChartData.swift
//  BudgetApp
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import Foundation
import SwiftUI

struct SavingsDataPoint: Identifiable {
    let month: String
    let value: Double
    var id = UUID()
}
