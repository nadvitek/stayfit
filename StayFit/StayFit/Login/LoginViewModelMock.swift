import Foundation

@Observable
class LoginViewModelMock: LoginViewModeling {
    
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
        isErrorLabelVisible = true
    }
}
