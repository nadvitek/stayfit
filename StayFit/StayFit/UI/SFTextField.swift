import SwiftUI

struct SFTextField: View {
    
    // MARK: - Private properties
    
    @Binding private var text: String
    private let placeholder: String
    private let type: SFTextFieldType
    
    // MARK: - Initializers
    
    init(text: Binding<String>, placeholder: String, type: SFTextFieldType = .small) {
        _text = text
        self.placeholder = placeholder
        self.type = type
        
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
                TextField(placeholder, text: $text)
                    .font(type.font)
                    .padding(.horizontal, 16)
                    .tint(.black)
            }
            .frame(width: type.maxWidth)
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
