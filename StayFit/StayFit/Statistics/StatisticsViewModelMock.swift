import Foundation

@Observable
class StatisticsViewModelMock: StatisticsViewModeling {

    var bestMonth: String = "January 2024"
    var monthRecord: Int = 13
    var favoriteActivity: TrainingType = .running
    var loaded: Bool = false
    
    // MARK: - Internal interface
    
    func loadData() {
        // do nothing
    }
}
