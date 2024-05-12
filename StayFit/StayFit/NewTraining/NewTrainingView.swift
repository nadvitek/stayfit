import SwiftUI

struct NewTrainingView: View {
    
    // MARK: - Properties
    
    @State private(set) var viewModel: NewTrainingViewModeling
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - UI

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("New Training")
                    .font(.semiLarge)
                    .foregroundStyle(.black)
                
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Activity")
                            .font(.semiMedium)
                        
                        
                        SFTypePicker(name: viewModel.typeSelected ? viewModel.trainingType.rawValue : "Type", picked: $viewModel.trainingType)
                    }
                    
                    Spacer()
                    
                    if viewModel.typeSelected {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 52, height: 52)
                            .overlay {
                                viewModel.trainingType.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                            }
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Place")
                        .font(.semiMedium)
                    
                    SFTextField(text: $viewModel.place, placeholder: "Insert place")
                }
                .padding(.top, 16)
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Date")
                            .font(.semiMedium)
                        
                        
                        SFDatePicker(name: viewModel.dateSelected ?  viewModel.date.parseDateToString() : "Date", picked: $viewModel.date)
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Notification")
                            .font(.semiMedium)
                        
                        
                        SFSwitch(state: $viewModel.isNotificationOn)
                    }
                    .padding(.top, 16)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Notes")
                        .font(.semiMedium)
                    
                    SFTextField(text: $viewModel.notes, placeholder: "Wonderful day")
                }
                .padding(.top, 16)
                
                if let photo = viewModel.image {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Photo")
                            .font(.semiMedium)
                        
                        photo
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .padding(.top, 16)
                } else {
                    SFButton(text: "Add Photo") {
                        // Implement
                    }
                }
                
                SFButton(text: "Create") {
                    viewModel.createTraining()
                }
            }
            .padding(.horizontal, 16)
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
        .onChange(of: viewModel.creationCompleted) {
            dismiss()
        }
        .background(.white)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    NewTrainingView(viewModel: NewTrainingViewModelMock())
}

#endif
