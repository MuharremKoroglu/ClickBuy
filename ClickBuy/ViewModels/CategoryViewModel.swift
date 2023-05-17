//
//  CategoryViewModel.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import Foundation

class CategoryViewModel : ObservableObject {
    
    @Published var categoryList : Categories = []
    private var webService = ApiCall()
    
    func fetchProduct (_ request : WebRequest) {
        
        webService.getCategories(request: request) { result in
            switch result {
                case .failure(let error) :
                    print(error)
                case .success(let categories) :
                DispatchQueue.main.async {
                    self.categoryList = categories
                }
            }
        }
    }
}


