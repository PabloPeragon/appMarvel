//
//  SeriesVeiwModel.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 13/6/24.
//

import Foundation

final class SeriesViewModel: ObservableObject {
    
    // MARK: Properties
    let repository : RepositoryImpl
    @Published var dataSeries: MarvelModel?
    
   
    
    // MARK: Init
    init(repository: RepositoryImpl, dataSeries: MarvelModel? = nil) {
        self.repository = repository
        self.dataSeries = dataSeries
    }
    
    // MARK: Functions
    func fetchSeries(hero: Int)  {
        DispatchQueue.main.async {
            Task {
                guard let series = try? await self.repository.getSeries(hero: hero) else {
                    print("Error al descargar las series.")
                    return
                }
                self.dataSeries = series
            }
        }
        
    }
}
