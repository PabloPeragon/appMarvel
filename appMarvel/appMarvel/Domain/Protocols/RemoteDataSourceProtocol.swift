//
//  RemoteDataSourceProtocol.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
    
    // MARK: Properties
    var urlRequestHelper: URLRequestHelperProtocol { get }
    
    // MARK: Functions
    func getHerosMarvel() async throws -> MarvelModel?
    func getSeries(hero: Int) async throws -> MarvelModel?
}
