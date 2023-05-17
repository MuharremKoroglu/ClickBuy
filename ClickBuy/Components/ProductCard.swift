//
//  ProductCard.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 14.05.2023.
//

import SwiftUI

struct ProductCard: View {
    
    let title : String
    let price : Double
    let image : String
    let rate : Double
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 180,height: 250)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                VStack{
                    
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable()
                            .renderingMode(.original)
                            .scaledToFit()
                            .padding(5)
                            .frame(width: 120,height: 120)
                    } placeholder: {
                        ProgressView()     
                    }
                    
                    VStack(alignment: .center){
                        
                            Text(title)
                                .font(.callout)
                                .fontWeight(.heavy)
                                .padding(.horizontal,5)
                                .multilineTextAlignment(.center)
                                .padding(.bottom,3)
                                //.minimumScaleFactor(0.5)
                                
                            Text("\(String(format: "%0.2f", price)) $")
                                .font(.subheadline)
                                .bold()
                                
                        HStack{
                            
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .scaledToFit()
                                .frame(width: 15,height: 15)
                                
                            Text("\(String(format: "%0.1f", rate))")
                                .font(.subheadline)
                                .bold()
                                
                        }.padding(.bottom,3)
                            
                    }
                    
                }
                
            }.frame(width: 180,height: 250)

                Button {
                    print("Button clicked")
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

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rate: 3.9)
    }
}
