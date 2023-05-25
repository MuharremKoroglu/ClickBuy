//
//  ProductRow.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 20.05.2023.
//

import SwiftUI

struct ProductRow: View {
    
    @ObservedObject var cartManager = CartManager()
    let selectedProduct : ProductList
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .frame(width:UIScreen.main.bounds.width - 15,height: 120)
            HStack(spacing: 20){
                
                AsyncImage(url: URL(string: selectedProduct.image)) { image in
                    image.resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                    
                } placeholder: {
                    ProgressView()
                }.frame(width: 100,height: 100)
                    .padding(.leading,10)
                VStack(alignment: .leading, spacing: 10) {
                    Text(selectedProduct.title)
                        .font(.system(size: 12))
                        .bold()
                    Text("\(String(format: "%0.2f", selectedProduct.price)) $")
                        .bold()
                    
                }
                Spacer()
                Text("\(selectedProduct.productQuantity)")
                    .font(.body)
                
                Button {
                    cartManager.removeFromCart(product: selectedProduct)
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.849, brightness: 0.832))
                    
                }.padding(.trailing,10)
            }.frame(width:UIScreen.main.bounds.width - 20,height: 120)
        }
        
    }
}

