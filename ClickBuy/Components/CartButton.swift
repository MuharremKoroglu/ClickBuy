//
//  CartButton.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 20.05.2023.
//

import SwiftUI

struct CartButton: View {
    var numberOfproduct : Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            Image(systemName: "cart")
                .resizable()
                .padding(.top,5)
                .frame(width: 35,height: 35)
                
            if numberOfproduct > 0 {
                Text("\(numberOfproduct)")
                    .font(.caption2)
                    .bold()
                    .frame(width: 20,height: 20)
                    .foregroundColor(.white)
                    .background(Color(hue: 1.0, saturation: 0.849, brightness: 0.832))
                    .cornerRadius(20)
            }
            
            
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfproduct: 1)
    }
}
