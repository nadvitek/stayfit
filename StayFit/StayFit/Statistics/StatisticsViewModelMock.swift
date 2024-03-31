import Foundation

@Observable
class StatisticsViewModelMock: StatisticsViewModeling {

    var favoriteActivity: String {
        "Running"
    }
    var bestMonth: String {
        "January 2024"
    }
    var monthRecord: Int {
        13
    }
    
    // MARK: - Initializers
    
    // MARK: - Internal interface
}
