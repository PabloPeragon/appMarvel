//
//  RepositoryProtocol.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation


protocol RepositoryProtocol {
    
    // MARK: Properties
    var remoteDataSource: RemoteDataSourceProtocol { get }
    
    // MARK: Functions
    func getHerosMarvel() async throws -> MarvelModel?
    func getSeries(hero: Int) async throws -> MarvelModel?
}
