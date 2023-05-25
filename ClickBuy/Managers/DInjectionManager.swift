//
//  DInjectionManager.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 25.05.2023.
//

import Foundation
import Swinject

struct DInjectionManager {
    
    static var container: Container = {
        let container = Container()
        
        container.register(ApiCall.self) { _ in ApiCall() }
        
        container.register(ProductViewModel.self) { resolver in
            ProductViewModel(webService: resolver.resolve(ApiCall.self)!)
        }
        
        container.register(CategoryViewModel.self) { resolver in
            CategoryViewModel(webService: resolver.resolve(ApiCall.self)!)
        }
        
        return container
    }()
}
