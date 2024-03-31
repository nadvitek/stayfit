import Foundation
import Observation

protocol StatisticsViewModeling {
    // TODO: - Resolve type after adding ActivityType enum
    var favoriteActivity: String { get }
    var bestMonth: String { get }
    var monthRecord: Int { get }
}

@Observable
class StatisticsViewModel: StatisticsViewModeling {

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
