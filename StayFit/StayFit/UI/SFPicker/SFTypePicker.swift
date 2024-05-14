import SwiftUI

struct SFTypePicker: View {
    
    // MARK: - Properties
    
    let name: String
    private let elements: [TrainingType] = TrainingType.allCases
    @Binding var picked: TrainingType
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            HStack(spacing: 8) {
                Text(name)
                    .font(.semiMedium2)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 16, height: 9)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .foregroundStyle(.sfBlack)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .foregroundStyle(.sfBlack)
            }
            
            Picker("", selection: $picked) {
                ForEach(elements, id:\.self) { element in
                    Text(element.rawValue)
                }
            }
            .pickerStyle(.menu)
            .tint(.clear)
        }
    }
}

#Preview {
    SFTypePicker(name: "Type", picked: .constant(.running))
}
