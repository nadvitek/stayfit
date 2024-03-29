import Foundation
import Observation

protocol LoginViewModeling {
    var email: String { get set }
    var password: String { get set }
    var isLogging: Bool { get set }
    var isErrorLabelVisible: Bool { get set }
    
    func onButtonTap()
}

@Observable
class LoginViewModel: LoginViewModeling {
    
    // MARK: - Internal properties
    
    var email: String = ""
    var password: String = ""
    var isLogging: Bool = true
    var isErrorLabelVisible: Bool = false
    
    // MARK: - Initializers
    
    init() {
    }
    
    // MARK: - Internal interface
    
    func onButtonTap() {
        guard !email.isEmpty && !password.isEmpty else { isErrorLabelVisible = true; return }
        
        if isLogging {
            login()
        } else {
            
        }
    }
    
    // MARK: - Private interface
    
    private func login() {
        UserDefaults.standard.set(true, forKey: "isLogged")
    }
    
    private func registrate() {
        
    }
}
