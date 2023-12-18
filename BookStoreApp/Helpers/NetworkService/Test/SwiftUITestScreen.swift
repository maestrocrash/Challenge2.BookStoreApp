//
//  SwiftUITestScreen.swift
//  BookStoreApp
//
//  Created by Daniil Kulikovskiy on 12/3/23.
//

import SwiftUI
import Kingfisher

struct SwiftUITestScreen: View {
    var network = NetworkDataFetcher()
    @StateObject var networkAggregateModel: NetworkAggregateModel
    @State var isbnArray = [Docs]()
    @State var isbn = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(networkAggregateModel.searchBooksList, id: \.key) { doc in
                        NavigationLink(destination: TestDetailView(networkAggregateModel: NetworkAggregateModel(), id: doc.key)) {
                            HStack {
                                let isbn = doc.isbn?.first ?? ""
                                
                                KFImage(URL(string: Kf.path(value: isbn, path: .isbn)))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 160)
                                
                                Text(doc.title)
                            }
                        }
                    }
                }
            }
            .task {
                do {
                    let data = try await network.searchQuery(search: "harry potter")
                    networkAggregateModel.searchBooksList.append(contentsOf: data.docs)
//                    print(networkAggregateModel.searchBooksList)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        .padding()
    }
}



#Preview {
    SwiftUITestScreen(networkAggregateModel: NetworkAggregateModel())
}

