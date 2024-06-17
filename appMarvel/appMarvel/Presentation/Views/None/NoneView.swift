//
//  NoneView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 1/6/24.
//

import SwiftUI

struct NoneView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    
    var body: some View {
    placeholder: do {
        ProgressView()
            .padding()
            .scaleEffect(x:2 , y:2)
            .tint(.blue.opacity(0.6))
            
    }
    }
}

#Preview {
    NoneView()
}
