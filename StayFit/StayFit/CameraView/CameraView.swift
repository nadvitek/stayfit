import SwiftUI

struct CameraView: View {
    
    // MARK: - Internal properties
    
    @State private(set) var viewModel: CameraViewModeling
    
    // MARK: - UI
    
    var body: some View {
        SFCamera(viewModel: viewModel)
            .ignoresSafeArea()
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    CameraView(viewModel: CameraViewModelMock())
}

#endif
