import SwiftUI

struct SFMenuView: View {
    
    @State private(set) var viewModel: SFMenuViewModeling
    
    // MARK: - UI
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                topView
                
                filterPart
                
                ScrollView {
                    VStack(spacing: 8) {}
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 16)
        }
    }
    
    // MARK: - Private helpers
    
    private var topView: some View {
        HStack(spacing: 0) {
            Text("Training Plan")
                .font(.semiLarge)
            
            Spacer()
            
            NavigationLink {
                // TODO: - Add Concrete View
                EmptyView()
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .foregroundStyle(.black)
    }
    
    private var filterPart: some View {
        HStack(alignment: .top, spacing: 8) {
            if viewModel.filterActivate {
                SFCrossButton {
                    viewModel.clearFilter()
                }
            }
            
            SFTypePicker(name: "Type", elements: viewModel.types, picked: $viewModel.filteredType)
            
            SFDatePicker(name: "Date", elements: viewModel.types, picked: $viewModel.filteredDate)
            
            Spacer()
        }
    }
}

#Preview {
    SFMenuView(viewModel: SFMenuViewModelMock())
}
