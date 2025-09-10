//
//  StaicListWithSimpleCustomRowView2.swift
//  List
//
//  Created by JunHeeJo on 9/9/25.
//

import SwiftUI

struct StaicListWithSimpleCustomRowView2: View {
    var body: some View {
        List {
            CustomRowView(
                title: "Apple",
                description: "Eat one a day",
                titleIcon: "🍎",
                count: 2
            )
            CustomRowView(
                title: "Banana",
                description: "High in potassium",
                titleIcon: "🍌",
                count: 3
            )
            CustomRowView(
                title: "Mango",
                description: "Soft and sweet",
                titleIcon: "🥭",
                count: 2
            )
        }
    }
}

private struct CustomRowView: View {
    var title: String
    var description: String?
    var titleIcon: String
    var count: Int
    
    init(title: String, description: String? = nil, titleIcon: String, count: Int = 1) {
        self.title = title
        self.description = description
        self.titleIcon = titleIcon
        self.count = count
    }
    
    var body: some View {
        HStack {
            Text(titleIcon)
                .font(.title)
                .padding(4)
                .background(Color(.tertiarySystemFill))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                if let description {
                    Text(description)
                        .font(.subheadline)
                }
            }
            Spacer()
            Text("\(count)")
                .font(.title)
        }
    }
}

#Preview {
    StaicListWithSimpleCustomRowView2()
}
