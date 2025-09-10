//
//  SearchableBooksListView.swift
//  List
//
//  Created by JunHeeJo on 9/10/25.
//

import SwiftUI
import Combine

struct SearchableBooksListView: View {
    @StateObject var viewModel = SearchableBooksVM()
    
    var body: some View {
        List(viewModel.books) { book in
            SearchableBookRowView(book: book)
        }
        .searchable(text: $viewModel.searchTerm)
        .textInputAutocapitalization(.none)
    }
}

#Preview {
    NavigationStack {
        SearchableBooksListView()
    }
}

struct SearchableBookRowView: View {
    var book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            Image(book.mediumCoverImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 90)
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text("by \(book.author)")
                    .font(.subheadline)
                Text("\(book.pages) pages")
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

class SearchableBooksVM: ObservableObject {
    @Published private var originalBooks = Book.samples
    @Published var books = [Book]()
    @Published var searchTerm: String = ""
    
    init() {
        Publishers.CombineLatest($originalBooks, $searchTerm)
            .map { books, searchTerm in
                books.filter { book in
                    searchTerm.isEmpty
                    ? true
                    : (book.title.matches(searchTerm) ||
                       book.author.matches(searchTerm))
                }
            }
            .assign(to: &$books)
    }
}

private extension String {
  func matches(_ searchTerm: String) -> Bool {
    self.range(of: searchTerm, options: .caseInsensitive) != nil
  }
}

