//
//  HomeView.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 11/5/24.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @ObservedObject var homeViewModel: HomeViewModel

    
    var body: some View {
        NavigationStack {
            List{
                if let data = homeViewModel.heroes?.data.results {
                    ForEach(data){ hero in
                        NavigationLink(destination: SeriesView(hero: hero, seriesViewModel: SeriesViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl()))), label: {
                            HeroCellView(hero: hero)
                        })
                        
                    }
                        
                                
                    }
                        
                        
                    }
                }
            .navigationBarTitle("Heroes")
            }
            
        }
       


#Preview {
    HomeView(homeViewModel: HomeViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
}

