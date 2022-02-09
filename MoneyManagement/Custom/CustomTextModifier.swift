//
//  CustomTextModifier.swift
//  MoneyManagement
//
//  Created by LeeHsss on 2022/02/08.
//

import SwiftUI

struct CustomTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.title)
            .frame(width: 200, height: 200)
            .background(Color.yellow)
    }
}

struct CustomTextModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
            .modifier(CustomTextModifier())
    }
}


