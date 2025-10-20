//
//  SubView.swift
//  PropertyWrapper
//
//  Created by JUNHEE JO on 10/20/25.
//


import SwiftUI

struct SubView: View {
    // @State로 하면 전체적으로 공유되지 않는다.
    @Binding var number: Int

    var body: some View {
        Text("number is \(number)")
        Button {
            number += 1
        } label: {
            Text("SubView Plus")
        }
    }
}

// 이전의 코드
#Preview {
    struct Preview: View {
        @State var number: Int = 0

        var body: some View {
            SubView(number: $number)
        }
    }

    return Preview()
}

// Binding을 전달해야하는데 간단하게 .constant로 전달가능하다.
// 하지만 고정값이다.
#Preview {
    SubView(number: .constant(10))
}

// @Previewable로 바인딩을 전달할 수 도 있다.
#Preview {
    @Previewable @State var num = 0
    SubView(number: $num)
}
