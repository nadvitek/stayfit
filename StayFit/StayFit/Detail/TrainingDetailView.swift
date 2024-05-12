import SwiftUI

struct TrainingDetailView: View {
    
    // MARK: - Properties

    @State private(set) var viewModel: TrainingDetailViewModeling
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - UI
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Training Detail")
                .font(.semiLarge)
                .foregroundStyle(.black)
            
            if let trainingItem = viewModel.trainingItem {
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
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Place")
                        .font(.semiMedium)
                    
                    
                    Text(trainingItem.place)
                        .font(.semiMedium2)
                        .foregroundStyle(.black)
                }
                .padding(.top, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Date")
                        .font(.semiMedium)
                    
                    
                    Text(trainingItem.date.parseDateToString())
                        .font(.semiMedium2)
                        .foregroundStyle(.black)
                }
                .padding(.top, 16)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Notes")
                        .font(.semiMedium)
                    
                    
                    Text(trainingItem.notes)
                        .font(.semiMedium2)
                        .foregroundStyle(.black)
                }
                .padding(.top, 16)
                
                if let photo = trainingItem.image {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Photo")
                            .font(.semiMedium)
                        
                        photo
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .padding(.top, 16)
                }
                
                Spacer()
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.loadTraining()
                    }
            }
        }
        .foregroundStyle(.black)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // TODO: - Add edit action
                } label: {
                    Text("Edit")
                        .font(.semiMedium2)
                        .foregroundStyle(.black)
                }
            }
        }
        .padding(.horizontal, 16)
        .background(.white)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    TrainingDetailView(viewModel: TrainingDetailViewModelMock())
}

#endif
