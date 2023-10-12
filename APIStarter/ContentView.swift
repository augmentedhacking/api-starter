//
//  ContentView.swift
//  APIStarter
//
//  Created by Nien Lam on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()

    var body: some View {
        VStack {
            Text(viewModel.dateString)
                .font(.title)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
