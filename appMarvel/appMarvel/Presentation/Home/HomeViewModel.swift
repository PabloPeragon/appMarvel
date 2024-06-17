//
//  HomeViewModel.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 2/6/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: Properties
    let repository: RepositoryProtocol
    @Published var heroes: MarvelModel? = MarvelModel(code: 1, status: "", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: DataMarvel(offset: 1, limit: 1, total: 1, count: 1, results: []))
    
    
    // MARK: Init
    init(repository: RepositoryProtocol) {
        self.repository = repository
        fetchHeroes()
    }
    
    // MARK: Functions
    func fetchHeroes() {
        DispatchQueue.main.async {
            Task {
                guard let heroes = try? await self.repository.getHerosMarvel() else {
                    print("Error al obtener los heroes")
                    return
                }
                self.heroes = heroes
            }
        }
    }
}
