import Foundation
import FirebaseCore
import FirebaseFirestore

protocol DataManaging {
    func retrieveTrainingList() async throws -> [QueryDocumentSnapshot]
    func createNewTraining() async
}

class DataManager: DataManaging {
    
    // MARK: - Properties
    
    private let fireStore: Firestore
    
    // MARK: - Initializers
    
    init() {
        self.fireStore = Firestore.firestore()
    }
    
    // MARK: - Internal interface
    
    func retrieveTrainingList() async throws -> [QueryDocumentSnapshot] {
        guard let userId = UserDefaults.standard.string(forKey: "userId") else { return [] }
        return try await fireStore.collection("trainingList_" + userId).getDocuments().documents
    }
    
    func createNewTraining() async {
        // TODO: - Implement
    }
}
