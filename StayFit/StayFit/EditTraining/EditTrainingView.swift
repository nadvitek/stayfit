import SwiftUI

struct EditTrainingView: View {
    
    // MARK: - Properties
    
    @State var viewModel: EditTrainingViewModeling
    @Environment(\.dismiss) var dismiss
    @Binding var trainingDeleted: Bool
    
    // MARK: - Initializers
    
    init(
        viewModel: EditTrainingViewModeling,
        trainingDeleted: Binding<Bool>
    ) {
        self._viewModel = State(wrappedValue: viewModel)
        self._trainingDeleted = trainingDeleted
    }
    
    // MARK: - UI

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text("Edit Training")
                    .font(.semiLarge)
                    .foregroundStyle(.black)
                
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Activity")
                            .font(.semiMedium)
                        
                        
                        SFTypePicker(name: viewModel.trainingItem.trainingType.rawValue, picked: $viewModel.trainingItem.trainingType)
                    }
                    
                    Spacer()
                    
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 52, height: 52)
                        .overlay {
                            viewModel.trainingItem.trainingType.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                        }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Place")
                        .font(.semiMedium)
                    
                    SFTextField(text: $viewModel.trainingItem.place, placeholder: "Insert place")
                }
                .padding(.top, 16)
                HStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Date")
                            .font(.semiMedium)

                        SFDatePicker(name: viewModel.trainingItem.date.parseDateToString(), picked: $viewModel.trainingItem.date)
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Notification")
                            .font(.semiMedium)
                        
                        
                        SFSwitch(state: $viewModel.trainingItem.isNotificationOn)
                    }
                    .padding(.top, 16)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Notes")
                        .font(.semiMedium)
                    
                    SFTextField(text: $viewModel.trainingItem.notes, placeholder: "Wonderful day")
                }
                .padding(.top, 16)
                
                if let photo = viewModel.trainingItem.image {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Photo")
                            .font(.semiMedium)
                        
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .padding(.top, 16)
                } else {
                    SFButton(text: "Add photo") {
                        viewModel.showCamera = true
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                SFButton(text: "Edit") {
                    viewModel.editTraining()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                SFButton(text: "Delete", buttonStyle: .caution) {
                    viewModel.deleteTraining { result in
                        guard result else { return }
                        dismiss()
                        trainingDeleted = true
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
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
        }
        .onChange(of: viewModel.editCompleted, {
            dismiss()
        })
        .onChange(of: viewModel.trainingItem.isNotificationOn, { _, newValue in
            viewModel.onNotificationChanged(to: newValue)
        })
        .fullScreenCover(isPresented: $viewModel.showCamera) {
            Camera(completionHandler: viewModel.imagePickerCompletionHandler)
        }
        .background(.white)
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    EditTrainingView(viewModel: EditTrainingViewModelMock(), trainingDeleted: .constant(false))
}

#endif
