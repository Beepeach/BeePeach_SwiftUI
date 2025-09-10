//
//  StaicListWithSimpleCustomRowView.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct StaicListWithSimpleCustomRowView: View {
    var body: some View {
        List {
            CustomRowView(title: "Apples", subtitle: "Eat one a day")
            CustomRowView(title: "Bananas", subtitle: "High in potassium")
        }
    }
}

private struct CustomRowView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
        }
    }
}

#Preview {
    NavigationStack {
        StaicListWithSimpleCustomRowView()
            .navigationTitle("List with custom row")
    }
    
}
