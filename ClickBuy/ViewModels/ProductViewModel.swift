//
//  ProductViewModel.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import Foundation
import SwiftUI

class ProductViewModel : ObservableObject {
    
    @Published var filteredProductList = [ProductList]()
    var productList = [ProductList]()
    private var webService = ApiCall()
    
    func fetchProduct (_ request : WebRequest) {
        webService.getProduct(request: request) { result in
            
            switch result {
                case .failure(let error) :
                    print(error)
                case .success(let products) :
                DispatchQueue.main.async {
                    self.productList = products.map { product in
                        var productList = ProductList(product: product)
                        productList.productQuantity = 0
                        return productList
                    }
                    self.filteredProductList = self.productList
                }
            }
        }
    }
    
    func filterProducts(with searchText : String) {
        if searchText.isEmpty {
            filteredProductList = productList
        }else{
            filteredProductList = productList.filter{ product in
                product.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

struct ProductList : Identifiable{

    var product : Product
    
    var productQuantity: Int = 0
    
    var id : Int {
        product.id
    }
    
    var title : String {
        product.title
    }
    
    var price : Double {
        product.price
    }
    
    var description : String {
        product.description
    }
    
    var category : String {
        product.category.rawValue
    }
    
    var image : String {
        product.image
    }
    
    var rate : Double {
        product.rating.rate
    }

}
