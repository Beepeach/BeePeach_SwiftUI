//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by JUNHEE JO on 10/20/25.
//

import SwiftUI

struct ContentView: View {
    // @State가 없으면 아래 +=1 에서 에러가 난다.
    @State var number: Int = 0

    var body: some View {
        VStack {
            Text("number is \(number)")
            Button {
                number += 1
            } label: {
                Text("Main Plus")
            }
            SubView(number: $number)
            SubView(number: $number)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
