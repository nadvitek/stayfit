import Foundation
import SwiftUI
import UIKit

class CameraCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent: Camera
    let completionHandler: (UIImage) -> Void
    
    init(parent: Camera, completionHandler: @escaping (UIImage) -> Void) {
        self.parent = parent
        self.completionHandler = completionHandler
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        completionHandler(image)
    }
}

struct Camera: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    
    let completionHandler: (UIImage) -> Void
    
    func makeCoordinator() -> CameraCoordinator {
        CameraCoordinator(parent: self, completionHandler: completionHandler)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
