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
    
    // MARK: - Private properties
    
    private let dependencies: AppDependency

    // MARK: - Initializers
    
    init(dependencies: AppDependency) {
        self.dependencies = dependencies
    }
    
    // MARK: - Internal interface
    
    func onButtonTap() {
        guard !email.isEmpty && !password.isEmpty else { isErrorLabelVisible = true; return }
        
        if isLogging {
            login()
        } else {
            registrate()
        }
    }
    
    // MARK: - Private interface
    
    private func login() {
        isErrorLabelVisible = false
        let loginModel = LoginModel(email: email, password: password)
        dependencies.loginManager.logIn(loginModel) { [weak self] in
            guard let self else { return }
            self.isErrorLabelVisible = true
        }
    }
    
    private func registrate() {
        isErrorLabelVisible = false
        let loginModel = LoginModel(email: email, password: password)
        dependencies.loginManager.registrate(loginModel) { [weak self] in
            guard let self else { return }
            self.isErrorLabelVisible = true
        }
    }
}
