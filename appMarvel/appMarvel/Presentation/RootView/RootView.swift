//
//  RootView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 3/5/24.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch (rootViewModel.status) {
        case Status.none:
            NoneView()
            
        case Status.loaded:
            TabView {
                HomeView(homeViewModel: HomeViewModel(repository: rootViewModel.repository))
            }
            
            
        case .loading:
            RootView()
        }
    }
}

#Preview {
    RootView()
}
