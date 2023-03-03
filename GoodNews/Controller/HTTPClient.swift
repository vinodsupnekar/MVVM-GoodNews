//
//  HTTPClient.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

public enum HTTPClientResult {
    case success(Data,HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func getArticles(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
