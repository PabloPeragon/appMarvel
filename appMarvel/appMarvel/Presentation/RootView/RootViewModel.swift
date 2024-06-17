//
//  RootViewModel.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 3/5/24.
//

import Foundation

enum Status {
    case none, loading, loaded
}


final class RootViewModel: ObservableObject {
    
    // MARK: Properties
    let repository: RepositoryProtocol
    @Published var status = Status.loaded
    
    // MARK: Init
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: Functions
}

