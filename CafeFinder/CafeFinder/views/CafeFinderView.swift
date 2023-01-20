//
//  CafeFinderView.swift
//  CafeFinder
//
//  Created by Beau Nouvelle on 20/1/2023.
//

import SwiftUI
import MapKit

struct CafeFinderView: View {

    @State var trackingMode: MapUserTrackingMode = .none
    @StateObject var model = ViewModel()

    var body: some View {
        ZStack {
            ScrollViewReader { proxy in

            Map(coordinateRegion: $model.region, interactionModes: .all, showsUserLocation: false, userTrackingMode: $trackingMode, annotationItems: model.cafes) { cafe in
                MapAnnotation(coordinate: cafe.placemark.coordinate) {

                    if cafe == model.selectedCafe {
                        Button {
                            print("tapped annotation")
                        } label: {
                            Circle().fill(Color.green).frame(width: 30)
                        }

                    } else {
                        Button {
                            model.selectedCafe = cafe
                            proxy.scrollTo(cafe.id)
                        } label: {
                            Circle().fill(Color.red).frame(width: 30)
                        }

                    }
                }
            }
            .ignoresSafeArea()
            .onReceive(model.$region) { _ in
                self.model.search()
            }
            .overlay(alignment: .bottom) {
                
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(model.cafes) { cafe in
                                Button {
                                    DispatchQueue.main.async {
                                        model.selectedCafe = cafe
                                    }
                                } label: {
                                    CardView(mapItem: cafe)
                                }
                                .id(cafe.id)
                            }
                        }
                        .padding()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}

struct CardView: View {

    let mapItem: MKMapItem

    var body: some View {
        VStack {
            Text(mapItem.placemark.name ?? "N/A")
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .shadow(radius: 5)
        }
    }

}

class ViewModel: ObservableObject {

    @Published var cafes: [MKMapItem] = []
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.865143, longitude: 151.209900), latitudinalMeters: 1000, longitudinalMeters: 1000)
    @Published var selectedCafe: MKMapItem? {
        didSet {
            guard let selectedCafe else { return }
            region = .init(center: selectedCafe.placemark.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
        }
    }

    func search() {
        if selectedCafe == nil {
            search(for: "Cafe")
        }
    }

    private func search(for queryString: String?) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.pointOfInterestFilter = MKPointOfInterestFilter(including: [MKPointOfInterestCategory.cafe])
        searchRequest.naturalLanguageQuery = queryString
        search(using: searchRequest)
    }

    private func search(using searchRequest: MKLocalSearch.Request) {
        // Confine the map search area to an area around the user's current location.
        searchRequest.region = region

        // Include only point-of-interest results. This excludes results based on address matches.
        searchRequest.resultTypes = .pointOfInterest

        let local = MKLocalSearch(request: searchRequest)
        local.start { [unowned self] (response, error) in
            guard error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.cafes = response?.mapItems ?? []
            }
        }
    }

}

extension MKMapItem: Identifiable {}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CafeFinderView()
    }
}
