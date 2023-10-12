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
        // Calculate some radius.
        // Always keep value at or above 10.
        let radius = max( (CGFloat(viewModel.dbOutput) + 60) * 3, 10 )

        VStack {
            Circle()
                .frame(width: radius)
                .foregroundColor(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
