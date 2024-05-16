import SwiftUI

struct TrainingDetailView: View {
    
    // MARK: - Properties

    @State private(set) var viewModel: TrainingDetailViewModeling
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 0) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                    
                    if let trainingItem = viewModel.trainingItem {
                        NavigationLink {
                            EditTrainingView(viewModel: EditTrainingViewModel(dependencies: appDependencies, trainingItem: trainingItem), trainingDeleted: $viewModel.trainingDeleted)
                        } label: {
                            Text("Edit")
                                .font(.semiMedium2)
                                .foregroundStyle(.black)
                        }
                    }
                }
                Text("Training Detail")
                    .font(.semiLarge)
                    .foregroundStyle(.black)
                
                if let trainingItem = viewModel.trainingItem {
                    trainingTypeView(trainingItem)
                    
                    placeView(trainingItem)
                    
                    dateView(trainingItem)
                    
                    notesView(trainingItem)
                    
                    photoView(trainingItem)
                    
                    Spacer()
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollBounceBehavior(.basedOnSize)
        .onChange(of: viewModel.trainingDeleted) {
            dismiss()
        }
        .foregroundStyle(.black)
        .onAppear {
            if !viewModel.trainingDeleted {
                viewModel.loadTraining()
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.horizontal, 16)
        .background(.white)
    }
    
    // MARK: - Private helpers
    
    private func trainingTypeView(_ trainingItem: TrainingItem) -> some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Activity")
                    .font(.semiMedium)
                
                
                Text(trainingItem.trainingType.rawValue)
                    .font(.semiMedium2)
                    .foregroundStyle(.black)
            }
            
            Spacer()
            
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: 52, height: 52)
                .overlay {
                    trainingItem.trainingType.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                }
        }
    }
    
    private func placeView(_ trainingItem: TrainingItem) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Place")
                .font(.semiMedium)
            
            
            Text(trainingItem.place)
                .font(.semiMedium2)
                .foregroundStyle(.black)
        }
        .padding(.top, 16)
    }
    
    private func dateView(_ trainingItem: TrainingItem) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Date")
                .font(.semiMedium)
            
            
            Text(trainingItem.date.parseDateToString())
                .font(.semiMedium2)
                .foregroundStyle(.black)
        }
        .padding(.top, 16)
    }
    
    private func notesView(_ trainingItem: TrainingItem) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Notes")
                .font(.semiMedium)
            
            
            Text(trainingItem.notes)
                .font(.semiMedium2)
                .foregroundStyle(.black)
        }
        .padding(.top, 16)
    }
    
    @ViewBuilder
    private func photoView(_ trainingItem: TrainingItem) -> some View {
        if let photo = trainingItem.image {
            VStack(alignment: .leading, spacing: 16) {
                Text("Photo")
                    .font(.semiMedium)
                
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.top, 16)
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    TrainingDetailView(viewModel: TrainingDetailViewModelMock())
}

#endif
