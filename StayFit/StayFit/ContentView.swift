import SwiftUI

struct ContentView: View {
    
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        if isLogged {
            SFTabView()
        } else {
            LoginView(viewModel: LoginViewModel())
        }
    }
}

#Preview {
    ContentView()
}
