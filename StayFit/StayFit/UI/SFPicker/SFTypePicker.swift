import SwiftUI

struct SFTypePicker: View {
    
    // MARK: - Properties
    
    let name: String
    let elements: [String]
    @Binding var picked: String
    @State var showPicker: Bool = false
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            HStack(spacing: 8) {
                Text(picked.isEmpty ? name : picked)
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
            
            Picker("", selection: $picked) {
                ForEach(elements, id:\.self) { element in
                    Text(element)
                }
            }
            .pickerStyle(.menu)
            .tint(.clear)
        }
    }
}

#Preview {
    SFTypePicker(name: "Type", elements: ["Running", "Yoga", "Basketball"], picked: .constant(""))
}
