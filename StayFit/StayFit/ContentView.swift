import SwiftUI

struct ContentView: View {
    
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        if userId.isEmpty {
            LoginView(viewModel: LoginViewModel(dependencies: appDependencies))
        } else {
            SFTabView()
        }
    }
}

#Preview {
    ContentView()
}
