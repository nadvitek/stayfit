import Foundation
import FirebaseCore
import FirebaseFirestore

protocol DataManaging {
    func retrieveTrainingList() async throws -> [QueryDocumentSnapshot]
    func saveTraining(_ trainingItem: TrainingItem) async
    func retrieveTraining(of id: String) async -> DocumentSnapshot?
    func deleteTraining(of id: String) async -> Bool
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
    
    func saveTraining(_ trainingItem: TrainingItem) async {
        guard let userId = UserDefaults.standard.string(forKey: "userId") else { return }
        let data = TrainingItemMapper.mapToFirebase(trainingItem)

        do {
            try await fireStore.collection("trainingList_" + userId)
                .document(trainingItem.id)
                .setData(data)
        } catch {
            print("Error writing document: \(error)")
        }
    }
    
    func retrieveTraining(of id: String) async -> DocumentSnapshot? {
        guard let userId = UserDefaults.standard.string(forKey: "userId") else { return nil }
        
        do {
            let document = try await fireStore.collection("trainingList_" + userId)
                .document(id)
                .getDocument()
            
            if document.exists {
                return document
            } else {
                print("Document doesn't exit")
            }
        } catch {
            print("Error getting document: \(error)")
        }
        
        return nil
    }
    
    func deleteTraining(of id: String) async -> Bool {
        guard let userId = UserDefaults.standard.string(forKey: "userId") else { return false }
        
        do {
            try await fireStore.collection("trainingList_" + userId)
                .document(id)
                .delete()
            
            print("success")
            return true
        } catch {
            print("Error deleting document: \(error)")
            return false
        }
    }
}
