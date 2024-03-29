import SwiftUI

struct UserView: View {
    
    @State private(set) var viewModel: UserViewModeling
    
    // MARK: - UI
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("User")
                        .font(.semiLarge)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("E-mail")
                            .font(.semiMedium)
                        
                        Text(viewModel.email)
                            .font(.semiMedium2)
                        
                        Text("Password")
                            .font(.semiMedium)
                        
                        SFTextField(text: $viewModel.password, placeholder: "New password")
                            .textContentType(.newPassword)
                    }
                    .foregroundStyle(.black)
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
            
            SFButton(text: "Change Password") {
                // TODO: - Implement changing password
            }
            .padding(.top, 32)
            
            Spacer()
            
            SFButton(text: "Log out", buttonStyle: .caution) {
                viewModel.logout()
            }
            .padding(.bottom, 32)
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    UserView(viewModel: UserViewModelMock(email: "nademvit@fel.cvut.cz"))
}

#endif
