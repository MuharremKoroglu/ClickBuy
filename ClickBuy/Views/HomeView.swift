//
//  ContentView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var productVM = ProductViewModel()
    @ObservedObject var categoryVM = CategoryViewModel()
    @State var selected = "Electronics"
    
    var colums = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Welcome to")
                        .font(.title2)
                    Text("Click Buy")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                }.padding()
                Spacer()
            }
            VStack{
                SearchBar(productVM: productVM)
            }
            HStack{
                ForEach(categoryVM.categoryList,id: \.self){ category in
                    TabButton(title: category.capitalized, selected: $selected,productVM: productVM)
                }
            }
            .padding(.horizontal,10)
            .padding(.top,15)
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: colums, spacing: 20){
                    ForEach(productVM.filteredProductList, id: \.id){ product in
                        ProductCard(title: product.title, price: product.price, image: product.image, rate: product.rate)
                        
                    }
                }.padding()
            }
        }.onAppear(){
            categoryVM.fetchProduct(WebRequest(endpoint: .products,path: ["categories"]))
            productVM.fetchProduct(WebRequest(endpoint: .products,path: ["category","electronics"]))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}