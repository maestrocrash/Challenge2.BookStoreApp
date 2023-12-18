//
//  EmptyView.swift
//  BookStoreApp
//
//  Created by MICHAIL SHAKHVOROSTOV on 07.12.2023.
//

import SwiftUI

struct EmptyViewSearch: View {
    
    @EnvironmentObject var viewModel: BookAppViewModel
    @Binding var query: String
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ZStack {
            
            Color(.secondarySystemBackground).ignoresSafeArea()
            
            VStack {
                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    ForEach(viewModel.searchBooksList, id: \.isbn) { book in
                        NavigationLink(destination: ProductView(keyBook: book.key, iaBook: book.ia?[0] ?? "" , authorName: book.authorNames)) {
                            ItemViewSearch(book: book)
                        }
                    }
                }
            }
            .preferredColorScheme(viewModel.isLightTheme ? .light : .dark)
        }
        
    }
}



#Preview {
    EmptyViewSearch(query: .constant("harry potter"))
}

//        NavigationView {
//            ScrollView(showsIndicators: false) {
//                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
//                    ForEach(viewModel.searchBooksList, id: \.isbn) { book in
//                        ItemViewSearch(book: book)
//                    }
//                }
//                .padding(.horizontal, 5)
//            }
//            .background(.yellow)
