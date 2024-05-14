import SwiftUI

struct StatisticsView: View {
    
    // MARK: - Properties
    
    @State private(set) var viewModel: StatisticsViewModeling
    
    // MARK: - UI
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Statistics")
                    .font(.semiLarge)
                if viewModel.loaded {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Favorite Activity")
                            .font(.semiMedium)
                        
                        Text(viewModel.favoriteActivity.rawValue)
                            .font(.semiMedium2)
                        
                        Text("Best Month")
                            .font(.semiMedium)
                        
                        Text(viewModel.bestMonth)
                            .font(.semiMedium2)
                        
                        Text("Most activites in one month")
                            .font(.semiMedium)
                        
                        Text(String(viewModel.monthRecord))
                            .font(.semiMedium2)
                        
                        Spacer()
                    }
                } else {
                    ProgressView()
                        .foregroundStyle(.sfBlack)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .padding(.horizontal, 16)
            .foregroundStyle(.black)

            Spacer()
        }
        .background(.white)
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    StatisticsView(viewModel: StatisticsViewModelMock())
}
