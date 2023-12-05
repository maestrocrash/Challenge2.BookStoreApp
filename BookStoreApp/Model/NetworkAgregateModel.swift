//
//  NetworkAgregateModel.swift
//  BookStoreApp
//
//  Created by Daniil Kulikovskiy on 12/5/23.
//

import Foundation


class NetworkAggregateModel: ObservableObject {
    
    @Published var searchBooksList: [Docs] = []
    @Published var coverIdList: [String] = []
    
}