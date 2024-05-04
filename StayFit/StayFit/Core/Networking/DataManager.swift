import Foundation
import FirebaseCore
import FirebaseFirestore

protocol DataManaging {
    func retrieveTrainingList()
}

class DataManager: DataManaging {
    
    // MARK: - Properties
    
    private let fireStore: Firestore
    
    // MARK: - Initializers
    
    init() {
        self.fireStore = Firestore.firestore()
    }
    
    // MARK: - Internal interface
    
    func retrieveTrainingList() async {
        do {
          let snapshot = try await fireStore.collection("users").getDocuments()
          for document in snapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
        } catch {
          print("Error getting documents: \(error)")
        }
    }
}
