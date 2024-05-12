import Foundation

@Observable
class SFMenuViewModelMock: SFMenuViewModeling {
    
    // MARK: - Internal properties
    
    var filteredType: TrainingType = .running
    var filteredDate: Date = Date()
    var filterActivated: Bool {
        true
    }
    var visibleData: [String : [TrainingItem]] = [
        "March 2022" : [.mock(), .mock()],
        "February 2022" : [.mock()]
    ]
    var dateFilterActivated: Bool = false
    var typeFilterActivated: Bool = false
    
    var isLoading: Bool = false
    
    // MARK: - Internal interface
    
    func clearFilter() {
        // do nothing
    }

    func loadData() {
        // do nothing
    }
}
