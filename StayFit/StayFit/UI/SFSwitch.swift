import SwiftUI

struct SFSwitch: View {
    
    // MARK: - Properties
    
    @Binding var state: Bool
    
    // MARK: - UI
    
    var body: some View {
        Toggle("", isOn: $state)
            .toggleStyle(SFToggleStyle())
    }
}

// MARK: - SFToggleStyle

struct SFToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundStyle(configuration.isOn ? .sfBlack : .white)
            .frame(width: 80, height: 40)
            .shadow(color: .black.opacity(0.5), radius: 10)
            .overlay(alignment: configuration.isOn ? .trailing : .leading) {
                Button {
                    configuration.isOn.toggle()
                } label: {
                    Circle()
                        .foregroundStyle(configuration.isOn ? .white : .sfBlack)
                        .padding(5)
                }
            }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    VStack(spacing: 16) {
        SFSwitch(state: .constant(false))
        
        SFSwitch(state: .constant(true))
    }
}

#endif
