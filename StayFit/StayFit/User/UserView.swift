import SwiftUI

struct UserView: View {
    
    // MARK: - Properties
    
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
                }
                .padding(.horizontal, 16)
                .foregroundStyle(.black)
                
                Spacer()
            }
            
            SFButton(text: "Change Password") {
                viewModel.changePassword()
            }
            .padding(.top, 32)
            .alert(isPresented: $viewModel.showSuccessAlert) {
                Alert(title: Text("Password changed successfully"), dismissButton: .cancel(Text("OK")))
            }
            
            Spacer()
            
            SFButton(text: "Log out", buttonStyle: .caution) {
                viewModel.logout()
            }
            .padding(.bottom, 32)
            .alert(isPresented: $viewModel.showFailureAlert) {
                Alert(title: Text("Changing password failed"), message: Text(viewModel.errorMessage), dismissButton: .cancel(Text("OK")))
            }
        }
        .background(.white)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    UserView(viewModel: UserViewModelMock(email: "nademvit@fel.cvut.cz"))
}

#endif
