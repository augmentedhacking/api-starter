//
//  ContentView.swift
//  APIStarter
//
//  Created by Nien Lam on 10/12/23.
//  Copyright © 2023 Line Break, LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()

    var body: some View {
        VStack {
            // Access heart rate in view model.
            Text("\(viewModel.currentHeartRate)")
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
