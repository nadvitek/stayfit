import SwiftUI

struct SFTabView: View {
    var body: some View {
        TabView {
            SFMenuView()
                .tabItem {
                    Label("Menu", systemImage: "doc.fill")
                }
            
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "waveform")
                }
            
            UserView()
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
