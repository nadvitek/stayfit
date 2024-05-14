import SwiftUI

struct SFTabView: View {
    
    // MARK: - Properties
    
    @AppStorage("userEmail") var userEmail: String = ""
    
    // MARK: - UI
    
    var body: some View {
        TabView {
            SFMenuView(viewModel: SFMenuViewModel(dependencies: appDependencies))
                .tabItem {
                    Label("Menu", systemImage: "doc.fill")
                }
            
            StatisticsView(viewModel: StatisticsViewModel(dependencies: appDependencies))
                .tabItem {
                    Label("Statistics", systemImage: "waveform")
                }
            
            UserView(viewModel: UserViewModel(dependencies: appDependencies, email: userEmail))
                .tabItem {
                    Label("User", systemImage: "person.crop.circle")
                }
        }
        .tint(.sfTabBlue)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    SFTabView()
}

#endif
