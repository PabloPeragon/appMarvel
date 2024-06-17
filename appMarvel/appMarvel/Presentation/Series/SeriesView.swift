//
//  SeriesView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 12/6/24.
//

import SwiftUI

struct SeriesView: View {
    
    // MARK: Properties
    var hero: Result
    @ObservedObject var seriesViewModel: SeriesViewModel
        
    var body: some View {
 
        List{
            if let data = seriesViewModel.dataSeries?.data.results {
                ForEach(data){ seriesM in
                    SeriesCellView(serie: seriesM)
                    
                }
            }
        }
        .onAppear {
            Task {
                seriesViewModel.fetchSeries(hero: hero.id)
            }
            
        }
        .navigationTitle("Series \(hero.name!)")
        .scrollContentBackground(.hidden)
        }
        }

#Preview {
    SeriesCellView(serie: Result(id: 3374, title: "Hulk (2008 - 2012)", name: "", description: "General Thunderbolt Ross spent years hunting the Hulk, but now he's become one himself! As the rampaging Red Hulk, Ross strives to reconcile the man he used to be with the monster he's becomes, smashing anything that moves along the way!", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/2/d0/5137710f56aa1", thumbnailExtension: Extension.jpg), resourceURI: "http://gateway.marvel.com/v1/public/series/3374"))
}

