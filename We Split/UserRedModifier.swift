//
//  UserRedModifier.swift
//  We Split
//
//  Created by Giovanni Gaffé on 2021/9/27.
//

import SwiftUI

struct WarningModier: ViewModifier {
    var text: String
    var value: Double
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            content
            Text(text)
                .foregroundColor(value == 0 ? .red : .black)
        }
    }
}

extension View {
    func warningMarked(with text: String, of value: Double) -> some View {
        self.modifier(WarningModier(text: text, value: value))
    }
}
