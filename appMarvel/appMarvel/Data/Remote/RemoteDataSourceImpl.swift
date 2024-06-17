//
//  RemoteDataSourceImpl.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation

final class RemoteDataSourceImpl: RemoteDataSourceProtocol {
   

    var urlRequestHelper: URLRequestHelperProtocol = URLRequestHelperImpl()
    
    
    func getHerosMarvel() async throws -> MarvelModel? {
        
        //Obtenemos la resquest
        guard let URLRequest = urlRequestHelper.getHerosMarvel() else {
            print("Error al crear la URLRequest de los heroes")
            return nil
        }
        // Cogemos el data y la respuesta del servidor
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        
        // Transformamos la respuesta del HTTPResponse y accedemos al status code
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Error al castear la respuesta del HTTPURLResponse")
            return nil
        }
        let statusCode = httpResponse.statusCode
        print("\(statusCode) RemoteDataSourceImpl")
        
        //Chequeamos es status code que nos manda el servidor.
        switch statusCode {
        case 200:
            do {
                let heroesModel = try JSONDecoder().decode(MarvelModel.self, from: data)
                print("Heroes: \(heroesModel)")
                return heroesModel
            } catch {
                print("Error al decodificar data: \(error)")
                return nil
            }
        
        case 400:
            print("Bad request error while fetching heroes from the API")
            return nil
        case 401:
            print("Authentication error while fetching heroes from the API")
            return nil
        default:
            print("Unknown error while fetching heroes from the API")
            return nil
        } 
    }
    
    func getSeries(hero: Int) async throws -> MarvelModel? {
        // Obtenemos la request
        guard let URLRequest = urlRequestHelper.getSeries(hero: hero) else {
            print("Error al crear la URLRequest de las series")
            return nil
        }
        // Obtenemos los datos y la respuesta del servidor.
        let (data, response) = try await URLSession.shared.data(for: URLRequest)
        
        //Extraemos el código HTTP de la respuesta
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Error al obtener la restuesta del servidor")
            return nil
        }
        let statusCode = httpResponse.statusCode
        
        //Check el statusCode
        switch statusCode {
        case 200:
            do {
                let seriesModel = try JSONDecoder().decode(MarvelModel.self, from: data)
                print("Series: \(seriesModel)")
                return seriesModel
            } catch {
                print("Error al decodificar data: \(error)")
                return nil
            }
            
            
        case 400:
            print("Bad request error while fetching heroes from the API")
            return nil
        case 401:
            print("Authentication error while fetching heroes from the API")
            return nil
        default:
            print("Unknown error while fetching heroes from the API")
            return nil
        }
    }
    
   
}
