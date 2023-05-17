//
//  WebRequest.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import Foundation

class WebRequest {
    
    private let baseURL = "https://fakestoreapi.com"
    private let endpoint : SWEndpoints
    private let path : [String]
    private let query : [URLQueryItem]
    
    
    init(endpoint: SWEndpoints, path: [String] = [], query: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.path = path
        self.query = query
    }
    
    private var urlString : String {
        var urlString = baseURL
        urlString += "/"
        urlString += endpoint.rawValue
        
        if !path.isEmpty {
            path.forEach {
                urlString += "/\($0)"
            }
        }
        
        if !query.isEmpty {
            urlString += "?"
            
            let queryString = query.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            urlString += queryString
        }
        
        return urlString
    }
    
    var url : URL {
        return URL(string: urlString)!
    }
    
    
    
}

enum SWEndpoints : String {
    case products
    case carts
    case users
    case auth
}
