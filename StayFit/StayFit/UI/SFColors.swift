import SwiftUI

// MARK: - Preview Extension

extension Rectangle {
    static func previewRectangle(_ color: Color) -> some View {
        Rectangle()
            .foregroundStyle(color)
            .frame(width: 100, height: 100)
            .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    VStack(spacing: 16) {
        Rectangle.previewRectangle(.sfBlack)

        Rectangle.previewRectangle(.sfRed)
    }
}
