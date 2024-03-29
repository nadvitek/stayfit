import Foundation

@Observable
class UserViewModelMock: UserViewModeling {
    
    // MARK: - Internal properties
    
    var email: String
    var password: String = ""
    
    // MARK: - Initializers
    
    init(email: String) {
        self.email = email
    }
    
    // MARK: - Internal interface
    
    func logout() {
        // do nothing
    }
}
