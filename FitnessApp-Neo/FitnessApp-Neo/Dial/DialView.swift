//
//  DialView.swift
//  FitnessApp-Neo
//
//  Created by Beau Nouvelle on 19/1/2023.
//

import SwiftUI

struct DialView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}
