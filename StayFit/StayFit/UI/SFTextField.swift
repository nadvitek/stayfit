import SwiftUI

struct SFTextField: View {
    
    // MARK: - Private properties
    
    @Binding private var text: String
    private let placeholder: String
    
    // MARK: - Initializers
    
    init(text: Binding<String>, placeholder: String) {
        _text = text
        self.placeholder = placeholder
    }
    
    // MARK: - UI
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 2)
            .foregroundStyle(.sfBlack)
            .frame(height: 59)
            .overlay {
                TextField(placeholder, text: $text)
                    .font(.system(size: 24, weight: .semibold))
                    .padding(16)
            }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    VStack(spacing: 16) {
        SFTextField(text: .constant(""), placeholder: "example1")
    }
    .padding(16)
}

#endif
