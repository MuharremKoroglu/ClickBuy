//
//  ProductRow.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 20.05.2023.
//

import SwiftUI

struct ProductRow: View {
    
    @ObservedObject var cartManager = CartManager()
    var selectedProduct : ProductList
    
    var body: some View {
           
            HStack(spacing: 20){
                AsyncImage(url: URL(string: selectedProduct.image)) { image in
                    image.resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .padding(.leading,10)
                } placeholder: {
                    ProgressView()
                }.frame(width: 100,height: 100)
                VStack(alignment: .leading, spacing: 10) {
                    Text(selectedProduct.title)
                        .font(.system(size: 11))
                        .bold()
                    Text("\(String(format: "%0.2f", selectedProduct.price)) $")
                        
                }
                Spacer()
                Text("\(selectedProduct.productQuantity)")
                    .font(.subheadline)
                Button {
                    cartManager.removeFromCart(product: selectedProduct)
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.849, brightness: 0.832))
                        
                }
   
            }.background( RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .frame(width:UIScreen.main.bounds.width - 15,height: 120))
            .padding(.horizontal,10)

    }
}

