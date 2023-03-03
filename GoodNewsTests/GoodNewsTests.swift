//
//  GoodNewsTests.swift
//  GoodNewsTests
//
//  Created by Rjvi on 03/03/23.
//

import XCTest
@testable import GoodNews

class GoodNewsTests: XCTestCase {

    func test_endToEndTestGET_ArticlesResult_matchesTestAccountData() {
        let testURL = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0b43f608c9a422fafbffcd40814a4ac")!
        let client = WebService(url: testURL, client: URLSessionHTTPClient())
        
        client.load { (result) in
            switch result {
            case let .success(articles):
                XCTAssertEqual(articles.count, 20)
            case let .failure(error):
                XCTFail("expected success articles, but got \(error) instead")
            }
        }
    }
    
    func test_endToAPICall_GET_ArticlesResult_withNonSingletonHTTPClient() {
        let testURL = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0b43f608c9a422fafbffcd40814a4ac")!
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        let client = WebService(url: testURL, client: URLSessionHTTPClient(session))

        client.load { (result) in
            switch result {
            case let .success(articles):
                XCTAssertEqual(articles.count, 20)
            case let .failure(error):
                XCTFail("expected success articles, but got \(error) instead")
            }
        }
        
    }
    
}
