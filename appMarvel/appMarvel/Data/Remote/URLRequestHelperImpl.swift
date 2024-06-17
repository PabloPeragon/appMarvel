//
//  URLRequestHelperImpl.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation

final class URLRequestHelperImpl: URLRequestHelperProtocol {
   
    

    func getHerosMarvel() -> URLRequest? {
        //Creacion de la URL
        guard let url = URL(string: "\(server)\(characters)?ts=\(ts)&apikey=\(apiKey)&hash=\(hash)") else {
            print("Error al crear la url de los heroes")
            return nil
        }
        
        // URL resquet
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethods.get
        urlRequest.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        print("\(urlRequest)")
        return urlRequest
    }
    
    func getSeries(hero: Int) -> URLRequest? {
        //Creacion de la URL
        guard let url = URL(string: "\(server)\(characters)/\(hero)/series?ts=\(ts)&apikey=\(apiKey)&hash=\(hash)") else {
            print("Error al crear la url de series")
            return nil
        }
        
        //URL request
        var urlResquest = URLRequest(url: url)
        urlResquest.httpMethod = HTTPMethods.get
        urlResquest.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        print("\(urlResquest)")
        
        return urlResquest
        
    } 
}
