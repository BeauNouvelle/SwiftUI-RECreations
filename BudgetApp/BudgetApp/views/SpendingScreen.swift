//
//  SpendingScreen.swift
//  BudgetApp
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import SwiftUI
import Charts

struct SpendingScreen: View {

    @State var selectedTab = "Monthly"
    var tabs = ["Monthly", "Weekly", "Daily"]

    var chartData = ["Monthly" : [SavingsDataPoint(month: "May", value: 4000),
                                  SavingsDataPoint(month: "Jun", value: 9880),
                                  SavingsDataPoint(month: "Jul", value: 6500),
                                  SavingsDataPoint(month: "Aug", value: 5500),
                                  SavingsDataPoint(month: "Sep", value: 8000),
                                  SavingsDataPoint(month: "Oct", value: 4000)],
                     "Weekly" : [SavingsDataPoint(month: "Mon", value: 342),
                                 SavingsDataPoint(month: "Tue", value: 567),
                                 SavingsDataPoint(month: "Wed", value: 231),
                                 SavingsDataPoint(month: "Thu", value: 234),
                                 SavingsDataPoint(month: "Fri", value: 986),
                                 SavingsDataPoint(month: "Sat", value: 564)],
                     "Daily" : [SavingsDataPoint(month: "May", value: 4000),
                                SavingsDataPoint(month: "Jun", value: 9880),
                                SavingsDataPoint(month: "Jul", value: 6500),
                                SavingsDataPoint(month: "Aug", value: 5500),
                                SavingsDataPoint(month: "Sep", value: 8000),
                                SavingsDataPoint(month: "Oct", value: 4000)]]

    var body: some View {
        VStack(alignment: .leading) {

            HeaderView()
                .padding(.horizontal)

            Text("$9,880.00")
                .font(.title)
                .bold()
                .padding()

            ScrollView {

                SegementedPicker(selected: $selectedTab, options: tabs)
                    .padding()

                ChartView(data: chartData[selectedTab]!)
                    .frame(minHeight: 200)
                    .padding()
                    .animation(.easeInOut, value: selectedTab)

                VStack(alignment: .leading, spacing: 20) {
                    Text("Invoices")
                        .font(.title)

                    Text("Cernbank, inc 280, 550 street 12/3, London")
                        .foregroundColor(.secondary)

                    HStack(spacing: 10) {
                        Tile()
                        Tile()
                    }
                    .padding(.horizontal)

                    HStack(spacing: 10) {
                        Tile()
                        Tile()
                    }
                    .padding(.horizontal)
                    .opacity(0.3)
                }
                .padding()
            }
        }
    }

}

struct Tile: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("#9283848")
                .foregroundColor(.secondary)
                .padding(.bottom)
            Text("App Store")
                .font(.headline)
            Text("12 Jun 2021, 11:00pm")
                .font(.caption)
                .foregroundColor(.secondary)

            Divider()
            HStack {
                Text("$120,00")
                    .font(.headline)
                Spacer()
                Image(systemName: "arrow.down.to.line")
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 2).foregroundColor(.secondary).opacity(0.2))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpendingScreen()
    }
}
