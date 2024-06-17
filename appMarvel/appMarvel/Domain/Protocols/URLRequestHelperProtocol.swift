//
//  URLRequestHelperProtocol.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 10/5/24.
//

import Foundation


protocol URLRequestHelperProtocol {
  
    
    // MARK: Functions
    func getHerosMarvel() -> URLRequest?
    func getSeries(hero: Int) -> URLRequest?
}
