//
//  ProductView.swift
//  BookStoreApp
//
//  Created by Aleksandr Rybachev on 03.12.2023.
//

import SwiftUI

struct ProductView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var viewModel: BookAppViewModel

    @State private var isWebViewPresented = false
    
    let book: WorksTrends
    
    var isUserLoggedIn = true
    // static data
    static let backButtonIbage = "arrow.backward"
    static let likeButtonImage = "heart"
    static let likeButtonImageFill = "heart.fill"
    static let descriptionText = "Description:"
    // mock data
    let bookNameText = MockDataProductView.bookNameText
    let webViewURL = MockDataProductView.webViewURL
    let title = MockDataProductView.navTitle
    let fullDescriptionText = MockDataProductView.fullDescriptionText

    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea()
            VStack {
                Text(book.title)
                    .font(.system(size: 24, weight: .semibold))
                // Перенести на экран настроек - start
                Button(action: {
                    viewModel.isLightTheme.toggle()
                }) {
                    Text("Toggle Mode")
                }
                // - end
                PictureTextView {
                    openWebView()
                }
                .padding(.top, 16)
                Text(Self.descriptionText)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                ScrollView {
                    Text(fullDescriptionText)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 14)
                }
            }
            .navigationTitle(title)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: CustomNavButton(image: Self.backButtonIbage, action: {
                    presentationMode.wrappedValue.dismiss()
                }),
                trailing: isUserLoggedIn ?
                CustomNavButton(image: Self.likeButtonImage, action: {
                    addToLikeTapped()
                }) : nil
            )
            NavigationLink(
                destination: WebView(urlString: webViewURL),
                isActive: $isWebViewPresented
            ) {
                EmptyView()
            }
            .padding()
            .preferredColorScheme(viewModel.isLightTheme ? .light : .dark)
            .onAppear {
                print(book)
                viewModel.fetchDetailBook(id: book.key)
            }
        }
    }

    private func addToLikeTapped() {
    }

    private func openWebView() {
        isWebViewPresented = true
    }
}

//#Preview {
//    let viewModel = BookAppViewModel()
//    return ProductView()
//        .environmentObject(viewModel)
//}

struct CustomNavButton: View {

    @State var changeLikedState: Bool = false

    let image: String
    let action: ()->()

    var body: some View {
        Button(action: {
            if image == ProductView.likeButtonImage { changeLikedState.toggle() }
            action()
        }) {
            Image(systemName: checkImage())
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(.black)
        }
    }

    func checkImage()-> String {
        image == ProductView.likeButtonImage ? (changeLikedState ? (ProductView.likeButtonImageFill) : (ProductView.likeButtonImage)): (image)
    }
}
