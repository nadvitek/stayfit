import Foundation
import Observation

protocol UserViewModeling {
    var email: String { get set }
    var password: String { get set }
    var showSuccessAlert: Bool { get set }
    var showFailureAlert: Bool { get set }
    var errorMessage: String { get set }
    
    func logout()
    func changePassword()
}

enum ChangePasswordState {
    case success, failure, none
}

@Observable
class UserViewModel: UserViewModeling {
    
    // MARK: - Internal properties
    
    var email: String
    var password: String = ""
    var showFailureAlert: Bool = false
    var showSuccessAlert: Bool = false
    var errorMessage: String = ""
    
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
        dependencies.loginManager.changePassword(password) { [weak self] error in
            guard let self else { return }
            if let error {
                print(error)
                errorMessage = error.localizedDescription
                self.showFailureAlert = true
            } else {
                self.showSuccessAlert = true
            }
        }
    }
}
