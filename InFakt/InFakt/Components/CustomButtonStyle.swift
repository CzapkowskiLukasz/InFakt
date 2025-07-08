//
//  Buttons.swift
//  InFakt
//
//  Created by Łukasz on 07/07/2025.
//

import SwiftUI

struct Buttons: View {
    
    var body: some View {
            VStack(spacing: 20) {
                Button("Solid") {
                    print("Tapped solid")
                }
                .buttonStyle(.solid)

                Button("Outline") {
                    print("Tapped outline")
                }
                .buttonStyle(.outline)
            }
            .padding()
        }
}

struct CustomButtonStyle: ButtonStyle {
    enum Mode {
        case solid
        case outline
    }

    let mode: Mode

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(mode == .solid ? Color.blueMain : Color.clear)
            .foregroundColor(mode == .solid ? .white : .blueMain)
            .overlay(
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(Color.blue, lineWidth: mode == .outline ? 2 : 0)
            )
            .cornerRadius(.infinity)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

extension ButtonStyle where Self == CustomButtonStyle {
    static var solid: CustomButtonStyle {
        CustomButtonStyle(mode: .solid)
    }

    static var outline: CustomButtonStyle {
        CustomButtonStyle(mode: .outline)
    }
}

#Preview {
    Buttons()
}
