import Foundation
import UIKit

protocol CameraViewModeling {
    var image: CGImage? { get set }
}

final class CameraViewModel: CameraViewModeling {
    
    var image: CGImage?
}
