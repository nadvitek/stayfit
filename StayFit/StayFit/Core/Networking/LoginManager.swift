import Foundation
import FirebaseAuth

protocol LoginManaging {
    func registrate(_ loginModel: LoginModel, failureHandler: @escaping () -> Void)
    func logIn(_ loginModel: LoginModel, failureHandler: @escaping () -> Void)
}

class LoginManager: LoginManaging {
    
    // MARK: - Properties
    
    private var processSuccess = false
    
    // MARK: - Internal interface
    
    func registrate(_ loginModel: LoginModel, failureHandler: @escaping () -> Void) {
        processSuccess = false
        
        Auth.auth().createUser(
            withEmail: loginModel.email,
            password: loginModel.password
        ) { authResult, error in
            if error == nil {
                UserDefaults.standard.set(loginModel.email, forKey: "userEmail")
                UserDefaults.standard.set(authResult?.user.uid, forKey: "userId")
            } else {
                failureHandler()
            }
        }
    }
    
    func logIn(_ loginModel: LoginModel, failureHandler: @escaping () -> Void) {
        processSuccess = false
        
        Auth.auth().signIn(
            withEmail: loginModel.email,
            password: loginModel.password
        ) { authResult, error in
            if error == nil {
                UserDefaults.standard.set(loginModel.email, forKey: "userEmail")
                UserDefaults.standard.set(authResult?.user.uid, forKey: "userId")
            } else {
                failureHandler()
            }
        }
    }
}
