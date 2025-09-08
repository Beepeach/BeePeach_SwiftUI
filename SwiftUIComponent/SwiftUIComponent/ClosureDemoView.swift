//
//  ClosureDemoView.swift
//  SwiftUIComponent
//
//  Created by JunHeeJo on 9/6/25.
//

import SwiftUI

private class PersonViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    
    func save() {
        print("Save to disk")
    }
}

struct ClosureDemoView: View {
    @State var message = ""
    @State var dirty = false
    @StateObject private var viewModel = PersonViewModel()
    
    var body: some View {
        Form {
            Section("\(self.dirty ? "*" : "")Input fileds") {
                TextField("First name", text: $viewModel.firstName)
                    .onChange(of: viewModel.firstName) { oldValue, newValue in
                        self.dirty = true
                    }
                
                TextField("Last Name", text: $viewModel.lastName)
                    .onChange(of: viewModel.lastName) { oldValue, newValue in
                        self.dirty = true
                    }
            }
            .onSubmit {
                viewModel.save()
            }
        }
    }
}

#Preview {
    ClosureDemoView(message: "message", dirty: false)
}
