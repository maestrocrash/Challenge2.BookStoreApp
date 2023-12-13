//
//  MainView.swift
//  BookStoreApp
//
//  Created by MICHAIL SHAKHVOROSTOV on 07.12.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: BookAppViewModel
    
//    @State private var selectedPicker = 1
    
    @State var seeMoreTop: Bool = true
    @State var seeMoreRecent: Bool = true
    
    var body: some View {
        VStack {
            VStack {
                TitleView(text: "Top Books", 
                          seeMore: $seeMoreTop)
                
                PickerView(viewModel: viewModel)
                
                if seeMoreTop {
                    CaruselBooksView(viewModel: viewModel)
                } else {
                    GridBooksView(viewModel: viewModel)
                }
            }
            
            VStack {
                TitleView(text: "Recent Books", seeMore: $seeMoreRecent)
                
                if seeMoreRecent {
                    CaruselBooksView(viewModel: viewModel)
                } else {
                    GridBooksView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: BookAppViewModel())
}
