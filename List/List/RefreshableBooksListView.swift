//
//  RefreshableBooksListView.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct RefreshableBooksListView: View {
    @StateObject var viewModel = RefreshableVM()
    
    var body: some View {
        List(viewModel.books) { book in
            RefreshableBookRowView(book: book)
        }
        .animation(.default, value: viewModel.books)
        .refreshable {
            await viewModel.refresh()
        }
    }
}

#Preview {
    RefreshableBooksListView()
}

private struct RefreshableBookRowView: View {
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

@MainActor
class RefreshableVM: ObservableObject {
    @Published var books: [Book] = Book.samples
    
    private func generateNewBook() -> Book {
        let title = "NewTitle"
        let author = "NewAuthor"
        let pageCount = Int.random(in: 42...999)
        return Book(
            title: title,
            author: author,
            isbn: "9781234567890",
            pages: pageCount
        )
    }
    
    func refresh() async {
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
        }
        catch { }
        
        let book = generateNewBook()
        books.insert(book, at: 0)
        
        do {
            try await Task.sleep(nanoseconds: 500_000_000)
        }
        catch { }
    }
}
