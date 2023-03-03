//
//  WebService.swift
//  GoodNews
//
//  Created by Rjvi on 03/03/23.
//

import Foundation

public struct Root: Decodable {
    let articles: [NewsFeed]
}

public struct NewsFeed: Decodable {
    let description: String?
    let title: String
    
}

public enum HTTPClientResult {
    case success([NewsFeed])
    case failure(Error)
}

class WebService {
    
    private struct UnexpectedValueReprentation: Error {
    }
    
    func getArticles(url: URL, completion: @escaping ((HTTPClientResult) -> Void)) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(HTTPClientResult.failure(error))
            } else if let data = data,
                      let response = response as? HTTPURLResponse {
//                completion(.success(data, response))
                do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let root =  try JSONDecoder().decode(Root.self, from: data)
                    completion(.success(root.articles))
                } catch {
                    completion(.failure(UnexpectedValueReprentation()))
                }
            } else {
                completion(.failure(UnexpectedValueReprentation()))
            }
            
        }.resume()
    }
}


