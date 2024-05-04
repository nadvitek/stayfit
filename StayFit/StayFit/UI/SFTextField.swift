import SwiftUI

struct SFTextField: View {
    
    // MARK: - Private properties
    
    @Binding private var text: String
    private let placeholder: String
    private let type: SFTextFieldType
    private let isSecure: Bool
    
    // MARK: - Initializers
    
    init(text: Binding<String>, placeholder: String, type: SFTextFieldType = .small, isSecure: Bool = false) {
        _text = text
        self.placeholder = placeholder
        self.type = type
        self.isSecure = isSecure
    }
    
    // MARK: - SFTextFieldType
    
    enum SFTextFieldType {
        case large, small
        
        var height: CGFloat {
            switch self {
            case .large:
                60
            case .small:
                44
            }
        }
        
        var maxWidth: CGFloat {
            switch self {
            case .large:
                .infinity
            case .small:
                200
            }
        }
        
        var font: Font {
            switch self {
            case .large:
                .semiMedium
            case .small:
                .semiMedium2
            }
        }
    }
    
    // MARK: - UI
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 2)
            .foregroundStyle(.sfBlack)
            .frame(height: type.height)
            .overlay {
                textField
                    .foregroundStyle(.black)
                    .font(type.font)
                    .tint(.black)
                    .padding(.horizontal, 16)
            }
            .frame(maxWidth: type.maxWidth)
    }
    
    @ViewBuilder
    private var textField: some View {
        if isSecure {
            SecureField("", text: $text, prompt: Text(placeholder).foregroundStyle(.gray))
        } else {
            TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.gray))
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    VStack(spacing: 16) {
        SFTextField(text: .constant(""), placeholder: "example1", type: .large)
        
        SFTextField(text: .constant(""), placeholder: "example1")
    }
    .padding(16)
}

#endif
