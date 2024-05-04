import Foundation

class AppDependency {
    let loginManager: LoginManaging = LoginManager()
    let dataManager: DataManaging = DataManager()
}

let appDependencies = AppDependency()
