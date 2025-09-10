//
//  AsyncFetchBooksListView.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

#Preview {
    AsyncFetchBooksListView()
}

struct AsyncFetchBooksListView: View {
    @StateObject fileprivate var viewModel = AsyncFetchBooksViewModel()
    
    var body: some View {
        List(viewModel.books) { book in
            AsyncFetchBookRowView(book: book)
        }
        .overlay {
            if viewModel.fetching {
                ProgressView("Fetching data, please wait...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
            }
        }
        .animation(.default, value: viewModel.books)
        .task {
            await viewModel.fetchData()
        }
    }
}

private struct AsyncFetchBookRowView: View {
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

private class AsyncFetchBooksViewModel: ObservableObject {
    @Published var books = [Book]()
    @Published var fetching = false
    
    @MainActor
    func fetchData() async {
        fetching = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
        } catch {
            
        }
        books = Book.samples
        fetching = false
    }
}

