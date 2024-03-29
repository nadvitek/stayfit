import SwiftUI

struct SFErrorLabel: View {
    
    // MARK: - Private properties
    
    let text: String
    
    // MARK: - UI
    
    var body: some View {
        HStack(spacing: 0) {
            Text(text)
                .font(.semiSmall)
                .foregroundStyle(.white)

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.sfRed)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    SFErrorLabel(text: "No account found.")
        .padding(.horizontal, 16)
}

#endif
