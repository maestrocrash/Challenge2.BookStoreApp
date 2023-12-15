//
//  CoreData.swift
//  BookStoreApp
//
//  Created by Daniil Kulikovskiy on 12/14/23.
//

import CoreData

class CoreData: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedRecentBooks: [BooksEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "Container")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data - \(error.localizedDescription)")
            } else {
                print("Successfully loaded Core Data")
            }
        }
        fetchRecentBooks()
    }
    
    func fetchRecentBooks() {
        let request = NSFetchRequest<BooksEntity>(entityName: "BooksEntity")
        do {
           savedRecentBooks = try container.viewContext.fetch(request)
        } catch let error {
            print("Data fetch request error - \(error)")
        }
    }
    
    func addBooksFromDetailBooks(detailBooks: [DetailBook]) {
        for detailBook in detailBooks {
            addBook(book: detailBook)
        }
    }
    
    func addBook(book: DetailBook) {
        let newBook = BooksEntity(context: container.viewContext)
        newBook.key = book.key
        newBook.name = book.subjectNames
        newBook.title = book.title
        for i in book.authors ?? [] {
            newBook.author = i.author.key
        }
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchRecentBooks()
        } catch let error {
            print("Error saving - \(error)")
        }
    }
}
