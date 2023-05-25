//
//  CartView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 20.05.2023.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cartManager = CartManager()

    var body: some View {
        VStack{
            if cartManager.products.count > 0 {
                ScrollView{
                    ForEach(cartManager.products, id: \.id) { product in
                        ProductRow(cartManager: cartManager,selectedProduct: product)
                            .padding(.bottom,10)
                            .padding(.top,10)
                    }
                    HStack{
                        Text("Your cart total is")
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(String(format: "%0.2f", cartManager.total)) $")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }.padding()
                        .background(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.black)
                            .shadow(radius: 10)
                            .frame(width:UIScreen.main.bounds.width - 15,height: 50)
                        )
                    NavigationLink {
                        OrderView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.black)
                                .frame(width:UIScreen.main.bounds.width - 15,height: 50)
                                .shadow(radius: 10)
                            HStack{
                                Image(systemName: "creditcard")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 30,height: 25)
                                
                                Text("Buy Now")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            }
                        }
                        
                    }
                }
            }else{
                VStack(alignment: .center){
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 50,height: 50)
                    
                    Text("Your cart is empty!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
