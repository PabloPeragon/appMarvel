//
//  appMarvelTests.swift
//  appMarvelTests
//
//  Created by Pablo Jesús Peragón Garrido on 2/5/24.
//

import XCTest
@testable import appMarvel

final class appMarvelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMarvelModel() {
        let code = 1
        let status = "Test status"
        let offset = 1
        let limit = 1
        
        
        let model = MarvelModel(code: 1, status: "Test status", copyright: "Test copyright", attributionText: "Test attributionText", attributionHTML: "attributionHTML", etag: "Text etag", data: DataMarvel(offset: 1, limit: 1, total: 1, count: 1, results: [Result(id: 1, title: "Text title", name: "Text name", description: "Text description", thumbnail: Thumbnail(path: "Text path", thumbnailExtension: Extension.jpg), resourceURI: "Text resourceURI")]))
    

        XCTAssertEqual(model.code, 1)
        XCTAssertEqual(model.status, "Test status")
        XCTAssertEqual(model.data.offset, 1)
        XCTAssertEqual(model.data.limit, 1)

    }
    
    func testHeros() async {
        let hero1 = Result(id: 1, title: "Test hero 1", name: "hero1", description: "Test hero 1", thumbnail: Thumbnail(path: "path", thumbnailExtension: Extension.jpg), resourceURI: "")
        XCTAssertNotNil(hero1)
        
        let hero2 = Result(id: 2, title: "Test hero 2", name: "hero2", description: "Test hero 2", thumbnail: Thumbnail(path: "path", thumbnailExtension: Extension.jpg), resourceURI: "")
        XCTAssertNotNil(hero2)
        
        let data = DataMarvel(offset: 0, limit: 0, total: 2, count: 2, results: [hero1, hero2])
        XCTAssertNotNil(data)
        
        let marvelModel = MarvelModel(code: 10, status: "success", copyright: "2023", attributionText: "", attributionHTML: "", etag: "", data: data)
        XCTAssertNotNil(marvelModel)
        
        XCTAssertEqual(marvelModel.data.results.count, 2)
        XCTAssertEqual(marvelModel.data.results.first?.name, "hero1")
        XCTAssertEqual(marvelModel.data.results.last?.title, "Test hero 2")
        
    }
    
    func testRepositoryImplHeros() async {
        
        var suite: RepositoryImpl = RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())
        XCTAssertNotNil(suite)
        
        let dataTest = try! await suite.getHerosMarvel()
        XCTAssertNotNil(dataTest)
        XCTAssertGreaterThan(dataTest!.data.count, 2)
        
    }
}
