//
//  BooksListView.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct BooksView: View {
    @StateObject fileprivate var viewModel = BooksVM()
    
    var body: some View {
        List($viewModel.books) { $book in
            EditableBookRowView(book: $book)
        }
    }
}

private struct EditableBookRowView: View {
    @Binding var book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.mediumCoverImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            VStack(alignment: .leading) {
                TextField(
                    "Book Title",
                    text: $book.title,
                    prompt: Text("Enter the book title")
                )
                Text("by \(book.author)")
                    .font(.subheadline)
                Text("\(book.pages) pages")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

private class BooksVM:  ObservableObject {
    @Published var books: [Book] = Book.samples
}

#Preview {
    BooksView()
}

struct Book: Equatable, Identifiable {
    var id = UUID()
    var title: String {
        didSet {
            print("\(title)")
        }
    }
    var author: String
    var isbn: String
    var pages: Int
    var isRead: Bool = false
}

extension Book {
  var smallCoverImageName: String { return "\(isbn)-S" }
  var mediumCoverImageName: String { return "\(isbn)-M" }
  var largeCoverImageName: String { return "\(isbn)-L" }
}

extension Book {
    static let samples = [
        Book(
            title: "Changer",
            author: "Matt Gemmell",
            isbn: "9781916265202",
            pages: 476
        ),
        Book(
            title: "SwiftUI for Absolute Beginners",
            author: "Jayant Varma",
            isbn: "9781484255155",
            pages: 200
        ),
        Book(
            title: "Why we sleep",
            author: "Mattew Walker",
            isbn: "9780141983769",
            pages: 369
        ),
        Book(
            title: "The Hitchhiker's Guide to the Galaxy",
            author: "Douglas Adams",
            isbn: "9780671461492",
            pages: 216
        )
    ]
}
