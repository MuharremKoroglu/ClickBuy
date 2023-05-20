//
//  ProductCard.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 14.05.2023.
//

import SwiftUI

struct ProductCard: View {
    
    @ObservedObject var cartManager = CartManager()
    let selectedProduct : ProductList
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180,height: 250)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                VStack{
                    Spacer()
                    AsyncImage(url: URL(string: selectedProduct.image)) { image in
                        image.resizable()
                            .renderingMode(.original)
                            .scaledToFit()
                            .padding(5)
                            
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 120,height: 120)
                    Spacer()
                    VStack(alignment: .center){
                        
                        Text(selectedProduct.title)
                            .font(.callout)
                            .fontWeight(.heavy)
                            .padding(.horizontal,5)
                            .multilineTextAlignment(.center)
                            .padding(.bottom,3)
                        //.minimumScaleFactor(0.5)
                        
                        Text("\(String(format: "%0.2f", selectedProduct.price)) $")
                            .font(.subheadline)
                            .bold()
                        
                        HStack{
                            
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(Color(hue: 1.0, saturation: 0.849, brightness: 0.832))
                                .scaledToFit()
                                .frame(width: 15,height: 15)
                            
                            Text("\(String(format: "%0.1f", selectedProduct.rate))")
                                .font(.subheadline)
                                .bold()
                            
                        }.padding(.bottom,3)
                        
                    }
                    Spacer()
                }
                
            }.frame(width: 180,height: 250)
            
            Button {
                cartManager.addToCart(product: selectedProduct)
            } label: {
                Image(systemName: "plus")
                    .padding(5)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(20)
                    .padding(5)
                
            }
        }
    }
}
