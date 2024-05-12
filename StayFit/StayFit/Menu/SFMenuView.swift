import SwiftUI

struct SFMenuView: View {
    
    // MARK: - Internal properties
    
    @State private(set) var viewModel: SFMenuViewModeling
    
    // MARK: - UI
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                topView
                    .padding(.horizontal, 16)
                
                filterPart
                
                scrollViewPart
            }
            .background(.white)
            .onAppear {
                viewModel.loadData()
            }
        }
    }
    
    // MARK: - Private helpers
    
    private var topView: some View {
        HStack(spacing: 0) {
            Text("Training Plan")
                .font(.semiLarge)
            
            Spacer()
            
            NavigationLink {
                NewTrainingView(viewModel: NewTrainingViewModel(dependencies: appDependencies))
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .foregroundStyle(.black)
    }
    
    private var filterPart: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 8) {
                if viewModel.filterActivated {
                    SFCrossButton {
                        viewModel.clearFilter()
                    }
                }
                
                SFTypePicker(name: viewModel.typeFilterActivated ? viewModel.filteredType.rawValue : "Type", picked: $viewModel.filteredType)
                
                SFDatePicker(name: viewModel.dateFilterActivated ?  viewModel.filteredDate.parseDateToString() : "Date", picked: $viewModel.filteredDate)
                
                Spacer()
            }
            .padding(.vertical, 2)
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
    }
    
    private var scrollViewPart: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(Array(viewModel.visibleData.keys), id: \.self) { key in
                    if let values = viewModel.visibleData[key] {
                        Text("\(key)")
                            .font(.semiMedium2)
                            .foregroundStyle(.black)
                            .padding(.top, 8)
                        itemsPart(values)
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .scrollIndicators(.hidden)
    }
    
    private func itemsPart(_ values: [TrainingItem]) -> some View {
        ForEach(values) { value in
            NavigationLink {
                TrainingDetailView(viewModel: TrainingDetailViewModel(dependencies: appDependencies, trainingId: value.id))
            } label: {
                SFTrainingItemView(trainingItem: value)
            }
        }
    }
}

#if DEBUG

// MARK: - Previews

#Preview {
    SFMenuView(viewModel: SFMenuViewModelMock())
}

#endif
