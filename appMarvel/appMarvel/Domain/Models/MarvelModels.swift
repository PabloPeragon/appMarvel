//
//  MarvelModels.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 9/5/24.
//

import Foundation

struct MarvelModel: Codable {

    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataMarvel
}

struct DataMarvel: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

struct Result: Codable, Identifiable {
    let id: Int
    let title: String?
    let name: String?
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String?
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    //para la descarga de fotos
    func getUrlImage(type: photoType = photoType.portrait) -> String {
        return "\(path)/\(type.rawValue).\(thumbnailExtension)"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}

enum photoType: String {
    case portrait = "portrait_xlarge"
    case landscape = "landscape_xlarge"
}
