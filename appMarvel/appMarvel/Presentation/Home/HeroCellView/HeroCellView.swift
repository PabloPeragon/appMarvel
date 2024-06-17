//
//  HeroCellView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 11/5/24.
//

import SwiftUI

struct HeroCellView: View {
    
    var hero: Result
    
    init(hero: Result) {
        self.hero = hero
    }
    
    
    
    var body: some View {
        VStack {
            // Imagen
            AsyncImage(url: URL(string: self.hero.thumbnail.getUrlImage(type: .landscape))) { image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.6)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.6)
                    .foregroundColor(.gray)
            }
            
            if let name = hero.name {
                Text("\(name)")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue.opacity(0.2))
        )
    }
}


#Preview {
    HeroCellView(hero: Result(id: 1011334, title: "", name: "3-D Man", description: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334"))
}
