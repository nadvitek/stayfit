import SwiftUI

struct SFDatePicker: View {
    
    // MARK: - Properties
    
    let name: String
    @Binding var picked: Date
    
    // MARK: - UI
    
    var body: some View {
        ZStack(alignment: .center) {
            HStack(spacing: 8) {
                Text(name)
                    .font(.semiMedium2)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 16, height: 9)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
            }

            DatePicker(
                "",
                selection: $picked,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
            .frame(maxWidth: 100)
            .opacity(0.015)
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    SFDatePicker(name: "Date", picked: .constant(.now))
}

#endif
