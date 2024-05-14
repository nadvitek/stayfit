import Foundation
import SwiftUI
import UIKit

struct SFCamera: UIViewControllerRepresentable {
    let viewModel: CameraViewModeling
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFCameraViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

class SFCameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let viewModel: CameraViewModeling
    
    init(viewModel: CameraViewModeling) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        // print out the image size as a test
        print(image.size)
    }
}
