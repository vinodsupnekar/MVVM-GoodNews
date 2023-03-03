//
//  URLSessionHttpClient.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    
    public init(_ session: URLSession = .shared) {
        self.session = session
    }
    
    private struct UnexpectedValueReprentation: Error {
    }
    
    func getArticles(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        self.session.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValueReprentation()))
            }
        }.resume()
    }
    
    
}
