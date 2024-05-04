import Foundation
import Observation

protocol UserViewModeling {
    var email: String { get set }
    var password: String { get set }
    
    func logout()
}

@Observable
class UserViewModel: UserViewModeling {
    
    // MARK: - Internal properties
    
    var email: String
    var password: String = ""
    
    // MARK: - Initializers
    
    init(email: String) {
        self.email = email
    }
    
    // MARK: - Internal interface
    
    func logout() {
        // TODO: - Add Dependencies and add this method to DI
        UserDefaults.standard.setValue("", forKey: "userId")
    }
}
