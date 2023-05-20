//
//  DetailView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 18.05.2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cartManager = CartManager()
    let selectedProduct : ProductList
    
    var body: some View {
        
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 600)
                    .shadow(radius: 10)
                VStack{
                    
                    AsyncImage(url: URL(string: selectedProduct.image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200,height: 200)
                    
                    Text(selectedProduct.title)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .padding(10)
                    
                    Text(selectedProduct.category.capitalized)
                        .font(.subheadline)
                        .padding(10)
                    
                    Text("\(String(format: "%0.2f", selectedProduct.price)) $")
                        .font(.title2)
                        .bold()
                        .padding(10)
                        
                    HStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(Color(hue: 1.0, saturation: 0.849, brightness: 0.832))
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                        
                        Text("\(String(format: "%0.1f", selectedProduct.rate))")
                            .font(.subheadline)
                            .bold()
                        
                    }.padding(10)
                    
                    Text(selectedProduct.description)
                        .font(.subheadline)
                        .padding(10)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.5)
                    
                    
                    
                }.frame(width: UIScreen.main.bounds.width - 30, height: 600)
                    
                
            }.frame(width: UIScreen.main.bounds.width - 10, height: 600)
             .padding(.top,5)
            
            Button {
                cartManager.addToCart(product: selectedProduct)
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width - 30,height: 45)
                        .shadow(radius: 10)
                    HStack{
                        Image(systemName: "cart")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30,height: 25)
                            
                        Text("Add to Cart")
                            .font(.headline)
                            .foregroundColor(.white)
                            
                    }
                }
            }.padding()

            
        }.navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .padding(.all, 10)
                            .bold()
                        
                    }
                }
            }
    }
}


