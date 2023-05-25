//
//  CartManager.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 20.05.2023.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var products: [ProductList] = []
    @Published private(set) var total: Double = 0

    var totalQuantities : Int {
        var totalQuantities : Int = 0
        for product in products {
            totalQuantities += product.productQuantity
        }
        return totalQuantities
    }
    
    func addToCart(product: ProductList) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].productQuantity += 1
        } else {
            var updatedProduct = product
            updatedProduct.productQuantity = 1
            products.append(updatedProduct)
        }
        total += product.price
    }
    
    func removeFromCart(product: ProductList) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            let existingProduct = products[index]
            if existingProduct.productQuantity > 1 {
                products[index].productQuantity -= 1
            } else {
                products.remove(at: index)
            }
            total -= product.price
        }
    }
    
    func removeAllProduct () {
        products = []
        total = 0
    }
}


