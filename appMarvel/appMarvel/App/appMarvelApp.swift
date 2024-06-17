//
//  appMarvelApp.swift
//  appMarvel
//
//  Created by Pablo Jesús Peragón Garrido on 2/5/24.
//

import SwiftUI

@main
struct appMarvelApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
        }
    }
}
