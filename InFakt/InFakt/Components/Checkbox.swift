//
//  Checkbox.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI

struct Checkbox: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .foregroundColor(isChecked ? .blueMain : .gray)
        }
    }
}

#Preview {
    Checkbox(isChecked: .constant(true))
}
