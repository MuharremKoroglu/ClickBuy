//
//  DetailView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 18.05.2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let title : String
    let price : Double
    let rate : Double
    let description : String
    let category : String
    let image : String
    
    var body: some View {
        
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 30, height: 600)
                    .shadow(radius: 10)
                VStack{
                    
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 200,height: 200)
                    
                    Text(title)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .padding(10)
                    
                    Text(category.capitalized)
                        .font(.subheadline)
                        .padding(10)
                    
                    Text("\(String(format: "%0.2f", price)) $")
                        .font(.title2)
                        .bold()
                        .padding(10)
                        
                    HStack{
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.red)
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                        
                        Text("\(String(format: "%0.1f", rate))")
                            .font(.subheadline)
                            .bold()
                        
                    }.padding(10)
                    
                    Text(description)
                        .font(.subheadline)
                        .padding(10)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .minimumScaleFactor(0.5)
                    
                    
                    
                }.frame(width: UIScreen.main.bounds.width - 30, height: 600)
                    
                
            }.frame(width: UIScreen.main.bounds.width - 10, height: 600)
             .padding(.top,5)
            
            Button {
                print("Added to cart")
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

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.95, rate: 3.9, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg")
    }
}
