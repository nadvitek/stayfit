import Foundation
import Observation

protocol UserViewModeling {
    var email: String { get set }
    var password: String { get set }
    
    func logout()
    func changePassword()
}

@Observable
class UserViewModel: UserViewModeling {
    
    // MARK: - Internal properties
    
    var email: String
    var password: String = ""
    
    // MARK: - Initializers
    
    private var dependencies: AppDependency
    
    init(
        dependencies: AppDependency,
        email: String
    ) {
        self.dependencies = dependencies
        self.email = email
    }
    
    // MARK: - Internal interface
    
    func logout() {
        dependencies.loginManager.logout()
    }
    
    func changePassword() {
        
    }
}
