import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .font(.semiLarge)
                .foregroundStyle(.black)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("")
            }
        }
    }
}

#Preview {
    LoginView()
}
