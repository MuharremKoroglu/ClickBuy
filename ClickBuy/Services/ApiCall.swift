//
//  ApiCall.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import Foundation

class ApiCall {
    
    func getProduct (request : WebRequest, completion : @escaping (Result<[Product],ErrorType>) -> Void) {
        
        URLSession.shared.dataTask(with: request.url) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription ?? "Something went wrong")
                completion(.failure(.URLisNotCorrect))
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return completion(.failure(.InvalidServiceResponse))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.DidntFetchData))
            }
            
            do{
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch {
                return completion(.failure(.DidntParseData))
            }
            
        }.resume()
    }
    
    func getCategories (request : WebRequest, completion : @escaping (Result<Categories,ErrorType>) -> Void) {
    
        
        URLSession.shared.dataTask(with: request.url) { data, response, error in
            
            if error != nil {
                print(error?.localizedDescription ?? "Something went wrong")
                completion(.failure(.URLisNotCorrect))
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return completion(.failure(.InvalidServiceResponse))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.DidntFetchData))
            }
            
            do{
                let categories = try JSONDecoder().decode(Categories.self, from: data)
                completion(.success(categories))
            }catch {
                return completion(.failure(.DidntParseData))
            }
            
        }.resume()
        
    }
}

enum ErrorType : Error {
    case URLisNotCorrect
    case InvalidServiceResponse
    case DidntFetchData
    case DidntParseData
}

