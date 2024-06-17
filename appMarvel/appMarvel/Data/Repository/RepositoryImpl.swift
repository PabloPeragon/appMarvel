//
//  RepositoryImpl.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation

final class RepositoryImpl: RepositoryProtocol {
   

    //MARK: Properties
    var remoteDataSource: RemoteDataSourceProtocol
    
    //MARK: Init
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    //MARK: Functions
    func getHerosMarvel() async throws -> MarvelModel? {
        return try await remoteDataSource.getHerosMarvel()
    }
    
    func getSeries(hero: Int) async throws -> MarvelModel? {
        return try await remoteDataSource.getSeries(hero: hero)
    }
    
    
}
