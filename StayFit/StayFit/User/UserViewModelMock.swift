import Foundation

@Observable
class UserViewModelMock: UserViewModeling {
    
    // MARK: - Internal properties
    
    var email: String
    var password: String = ""
    var changePasswordState: ChangePasswordState = .none
    var showSuccessAlert: Bool = false
    var showFailureAlert: Bool = false
    var errorMessage: String = ""
    
    // MARK: - Initializers
    
    init(email: String) {
        self.email = email
    }
    
    // MARK: - Internal interface
    
    func logout() {
        // do nothing
    }

    func changePassword() {
        // do nothing
    }
}
