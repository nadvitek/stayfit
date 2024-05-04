import SwiftUI

struct SFCrossButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 25, height: 25)
                .padding(8)
                .background {
                    Circle()
                        .stroke(lineWidth: 3)
                }
                .rotationEffect(.degrees(45))
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    SFCrossButton {}
}
