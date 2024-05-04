import SwiftUI

struct ContentView: View {
    
    @AppStorage("isLogged") var isLogged = true
    
    var body: some View {
        if isLogged {
            SFTabView()
        } else {
            LoginView(viewModel: LoginViewModel(dependencies: appDependencies))
        }
    }
}

#Preview {
    ContentView()
}
