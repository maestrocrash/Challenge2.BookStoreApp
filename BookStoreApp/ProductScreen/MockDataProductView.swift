//
//  MockData.swift
//  BookStoreApp
//
//  Created by Alex on 06.12.2023.
//

import Foundation

class MockDataProductView {

    static let fullDescriptionText = """
    Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he must keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde's most important creations and among the classic achievements of its kind.
        Oscar Wilde’s only novel is the dreamlike story of a young man who sells his soul for eternal youth and beauty. In this celebrated work Wilde forged a devastating portrait of the effects of evil and debauchery on a young aesthete in late-19th-century England. Combining elements of the Gothic horror novel and decadent French fiction, the book centers on a striking premise: As Dorian Gray sinks into a life of crime and gross sensuality, his body retains perfect youth and vigor while his recently painted portrait grows day by day into a hideous record of evil, which he must keep hidden from the world. For over a century, this mesmerizing tale of horror and suspense has enjoyed wide popularity. It ranks as one of Wilde's most important creations and among the classic achievements of its kind.
    """

    static let webViewURL = "https://archive.org/embed/harrypotterchamb0000rowl_i9i5"
    static let navTitle = "Title"
    static let bookNameText = "The Picture of Dorian Gray"

    static let sampleBooks = [
        Book(image: "book_cover", description: "Описание книги"),
        Book(image: "book_cover", description: "Описание книги"),
        Book(image: "book_cover", description: "La la lalal alala alalla lala laLa la lalal alala alalla lala laLa la lalal alala alalla lala laLa la lalal alala alalla lala laLa la lalal alala alalla lala laLa la lalal alala alalla lala la")
    ]

    static let categories = ["Category 1", "Category 2", "Category 3", "Category 4", "Category 5", "Category 6", "Category 7", "Category 8", "Category 9", "Category 13", "Category 14", "Category 15", "Category 16", "Category 17", "Category 18"]
}
