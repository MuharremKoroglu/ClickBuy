//
//  TabButton.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import SwiftUI

struct TabButton: View {
    
    var title : String = "Electronics"
    @Binding var selected : String
    @ObservedObject var productVM = ProductViewModel()
    
    var body: some View {
        
        Button {
            selected = title
            let lowerTitle = title.lowercased()
            productVM.fetchProduct(WebRequest(endpoint: .products,path: ["category","\(lowerTitle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "electronics")"]))
        } label: {
            Text(title)
                .font(.system(size: 12))
                .fontWeight(.heavy)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal,selected == title ? 5 : 0)
                .background(){
                    ZStack{
                        if selected == title {
                            Color.black
                                .clipShape(Capsule())
                        }
                    }
                }
        }
        
    }
}

