import SwiftUI

@main
struct StayFitApp: App {
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(.sfTabBlack)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
