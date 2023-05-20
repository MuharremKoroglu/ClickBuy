//
//  SearchBar.swift
//  ClickBuy
//
//  Created by Muharrem Köroğlu on 13.05.2023.
//

import SwiftUI

struct SearchBar: View {
    
    @ObservedObject var productVM = ProductViewModel()
    @State var searchText = ""
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
                .font(.system(size: 20,weight: .bold))
            
            TextField("Search a new product", text: $searchText)
                .tint(.primary)
                .overlay (
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20,weight: .bold))
                        .foregroundColor(.primary)
                        .padding()
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            productVM.filterProducts(with: searchText)
                        }
                    
                    ,alignment: .trailing
                )
            
        }.font(.headline)
            .padding()
            .background{
                Color.black.opacity(0.1)
            }
            .cornerRadius(20)
            .padding(.horizontal,10)
            .onChange(of: searchText) { newValue in
                productVM.filterProducts(with: searchText)
            }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
