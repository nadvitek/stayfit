import SwiftUI

struct LoginView: View {
    
    // MARK: - Properties
    
    @State private var viewModel: LoginViewModeling
    
    // MARK: - Initializers
    
    init(viewModel: LoginViewModeling) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        VStack(spacing: 16) {
            Text(viewModel.isLogging ? "Login" : "Registration")
                .font(.semiLarge)
                .foregroundStyle(.black)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Email")
                    .foregroundStyle(.black)
                    .font(.semiMedium)
                
                SFTextField(text: $viewModel.email, placeholder: "example@gmail.com", type: .large)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Password")
                    .foregroundStyle(.black)
                    .font(.semiMedium)
                
                SFTextField(text: $viewModel.password, placeholder: "example123", type: .large, isSecure: true)
                    .keyboardType(.default)
                    .textInputAutocapitalization(.never)
            }
            
            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: 40)
                .overlay {
                    if viewModel.isErrorLabelVisible {
                        SFErrorLabel(text: "No account with this input found.")
                    }
                }
            
            SFButton(text: viewModel.isLogging ? "Log in" : "Registrate") {
                viewModel.onButtonTap()
            }
            
            Spacer()
            
            Button {
                viewModel.isLogging.toggle()
            } label: {
                Text(viewModel.isLogging ? "Registration" : "Login")
                    .foregroundStyle(.black)
                    .font(.semiMedium)
                    .underline()
                    .contentTransition(.identity)
            }
            .safeAreaPadding(.bottom, 100)
        }
        .padding(.horizontal, 16)
        .animation(.easeOut(duration: 0.5), value: viewModel.isErrorLabelVisible)
        .animation(.easeOut(duration: 0.5), value: viewModel.isLogging)
        .background(.white)
    }
}

// MARK: - Previews

#if DEBUG

#Preview {
    LoginView(viewModel: LoginViewModelMock())
}

#endif
