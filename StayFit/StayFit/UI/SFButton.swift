import SwiftUI

struct SFButton: View {
    
    // MARK: - Private properties
    
    private let text: String
    private let buttonStyle: SFButtonStyle
    private let action: () -> Void
    
    // MARK: - Initializers
    
    init(text: String, buttonStyle: SFButtonStyle = .normal, action: @escaping () -> Void) {
        self.text = text
        self.buttonStyle = buttonStyle
        self.action = action
    }
    
    // MARK: - SFButtonStyle
    
    enum SFButtonStyle {
        case normal, caution
        
        var bgColor: Color {
            switch self {
            case .normal:
                .sfBlack
            case .caution:
                .sfRed
            }
        }
    }
    
    // MARK: - UI
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.semiMedium)
                .foregroundStyle(.white)
                .padding(.horizontal, 64)
                .padding(.vertical, 16)
                .background(buttonStyle.bgColor)
                .clipShape(.rect(cornerRadius: 8))
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    VStack(spacing: 16) {
        SFButton(text: "Login") {}
        
        SFButton(text: "Delete", buttonStyle: .caution) {}
    }
}

#endif
