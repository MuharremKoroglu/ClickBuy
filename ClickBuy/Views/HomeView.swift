//
//  ContentView.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 12.05.2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var productVM : ProductViewModel = DInjectionManager.container.resolve(ProductViewModel.self)!
    @ObservedObject var categoryVM : CategoryViewModel = DInjectionManager.container.resolve(CategoryViewModel.self)!
    @ObservedObject var cartManager = CartManager()
    @State var selected = "Electronics"
    var colums = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    
    var body: some View {
        let lowercaseSelected = selected.lowercased()
        
        NavigationStack{
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
                    NavigationLink {
                        CartView(cartManager: cartManager)
                    } label: {
                        CartButton(numberOfproduct: cartManager.totalQuantities)
                            .padding(.top,20)
                            .padding(.trailing,15)
                    }
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
                            NavigationLink {
                                DetailView(cartManager: cartManager,selectedProduct: product)
                            } label: {
                                ProductCard(cartManager: cartManager, selectedProduct: product)
                            }
                        }
                    }.padding()
                }
            }.onAppear(){
                categoryVM.fetchProduct(WebRequest(endpoint: .products,path: ["categories"]))
                productVM.fetchProduct(WebRequest(endpoint: .products,path: ["category","\(lowercaseSelected.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "electronics")"]))
            }
            
        }.tint(.black)
         .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
