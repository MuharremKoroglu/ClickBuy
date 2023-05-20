//
//  OrderView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 21.05.2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var cartManager = CartManager()
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 100,height: 100)
                    .padding()
                Text("We received your order")
                    .font(.title)
                    .bold()
                NavigationLink {
                    HomeView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.black)
                            .frame(width: 150,height: 50)
                            .shadow(radius: 10)
                        Text("Back To Home")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }.padding()
            }
        }.onAppear{
            cartManager.removeHoleProduct()
        }
        .navigationBarBackButtonHidden()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
