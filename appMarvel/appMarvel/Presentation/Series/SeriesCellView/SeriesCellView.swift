//
//  SeriesCellView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 12/6/24.
//

import SwiftUI

struct SeriesCellView: View {
    var serie: Result
    
    
    var body: some View {
        VStack {

                if let title = serie.title {
                    Text("\(title)")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .bold()
                }
                
                //Foto serie
                AsyncImage(url: URL(string: serie.thumbnail.getUrlImage(type: .portrait))) { photo in
                    photo
                        .resizable()
                        .cornerRadius(10)
                        .opacity(0.3)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .opacity(0.3)
                        .aspectRatio(contentMode: .fit)
                }
            
            if let description = serie.description {
                Text("\(description)")
                    .font(.headline)
            }else {
                Text("Sin descripción")
            }
   
            }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue.opacity(0.3))
        )
        }
    }
    


#Preview {
    let data = DataMarvel(offset: 0, limit: 0, total: 2, count: 2, results: [Result(id: 2005, title: "Deadpool (1997 - 2002)", name: "", description: "Wade Wilson: Heartless Merc With a Mouth or...hero? Laugh, cry and applaud at full volume for the mind-bending adventures of Deadpool, exploring the psyche and crazed adventures of Marvel's most unstable personality!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/7/03/5130f646465e3", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/series/2005")])
    
    
    return SeriesCellView(serie: data.results.first!)
}
