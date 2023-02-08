//
//  ContentView.swift
//  Coworking Space
//
//  Created by Beau Nouvelle on 9/2/2023.
//

import SwiftUI

struct Venue {
    let name: String = "Happiness Cafe Roastery"
    let rating: Int = 4
    let address: String = "Jalan, Ciujung Raya no. 7, Sleman, Yogykarta"
    let facilities: [Facility] = [.init(systemImage: "wifi", title: "Wifi"),
        .init(systemImage: "snowflake", title: "AC")]
    let pricePerHour: Int = 150

    let tabbableItems = Menu()
}

struct Facility: Identifiable {
    let id = UUID()
    let systemImage: String
    let title: String
}

protocol Tabbable: Identifiable {
    associatedtype Content: View
    var view: Content { get }
}

struct Menu: Tabbable {
    var id = UUID()

    let items: [MenuItem] = [.init(image: "background_1", title: "Berry Gelato", description: "Double flavors of berry", price: 25), .init(image: "background_1", title: "Berry Gelato", description: "Double flavors of berry", price: 25)]

    var view: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(items) { menuItem in
                    ZStack {
                        HStack {
                            Image(menuItem.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack {
                                Text(menuItem.title)
                                    .font(.headline)
                                Text(menuItem.description)
                                    .foregroundColor(.secondary)
                                Text("\(menuItem.price)")
                                    .foregroundColor(.accentColor)
                            }
                        }
                    }
                }
            }
        }
    }

}

struct Reviews: Tabbable {
    var id = UUID()

    var view: some View {
        Text("Reviews")
    }
}

struct Contact: Tabbable {
    var id = UUID()

    var view: some View {
        Text("Contact")
    }
}

struct MenuItem: Identifiable, Equatable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    let price: Int
}

struct ContentView: View {

    let venue = Venue()
    @State var headerBackgroundOpacity: CGFloat = 1

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerImages

                VStack(alignment: .leading, spacing: 10) {
                    Text(venue.name)
                        .font(.title2)
                        .bold()

                    HStack {
                        Image(systemName: "pin")
                        Text(venue.address)
                            .font(.footnote)
                    }
                    .foregroundColor(.secondary)

                    HStack {
                        ForEach(1..<6) { count in
                            Image(systemName: "star.fill")
                                .foregroundColor(count <= venue.rating ? Color.yellow : Color.secondary)
                        }
                        Spacer()
                        Text("Pr \(venue.pricePerHour)k / hour")
                    }
                    .bold()

                    Text("Facilities")
                        .font(.title3)
                        .bold()
                        .padding(.top)

                    HStack {
                        ForEach(venue.facilities) { facility in
                            Image(systemName: facility.systemImage)
                                .foregroundColor(.accentColor)
                            Text(facility.title)
                            if (facility.id == venue.facilities.last?.id) == false {
                                Divider()
                            }
                        }
                    }
                    .padding()
                    .background(Capsule().fill(Color(uiColor: .systemBackground)))

//                    HStack {
//                        ForEach(Array(venue.tabbableItems)) { tab in
//
//                        }
//                    }

                    venue.tabbableItems.view

                }
                .padding(10)
                .padding(.horizontal)
                .background(.thickMaterial)
            }
        }
        .coordinateSpace(name: "scroll")
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            headerButtons
                .background(
                    .ultraThinMaterial.opacity(headerBackgroundOpacity)
                )
        }
    }

    var headerButtons: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "chevron.left")
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .bold()
            }
            Spacer()
            Button {

            } label: {
                Image(systemName: "bookmark.fill")
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding()
    }

    var headerImages: some View {
        ZStack(alignment: .top) {
            TabView {
                Image("header_1")
                Image("header_2")
                Image("header_3")
            }
            .tabViewStyle(.page)
            .frame(height: 350)
        }
        .background(
            GeometryReader {
                Color.clear.preference(key: ScrollViewOffsetKey.self, value: -$0.frame(in: .named("scroll")).minY)
            }
        )
        .onPreferenceChange(ScrollViewOffsetKey.self) { valueChanged in
            headerBackgroundOpacity = valueChanged / 50
        }
    }
}

struct ScrollViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat

    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
