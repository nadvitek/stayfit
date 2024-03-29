import Foundation
import Observation

protocol LoginViewModeling {
    var email: String { get set }
    var password: String { get set }
    
    func login()
}

@Observable
class LoginViewModel: LoginViewModeling {
    
    // MARK: - Internal properties
    
    var email: String = ""
    var password: String = ""
    
    // MARK: - Initializers
    
    init() {
    }
    
    // MARK: - Internal interface
    
    func login() {
        // TODO: - Implement later
    }
}
