import Foundation

@Observable
class SFMenuViewModelMock: SFMenuViewModeling {
    
    // MARK: - Internal properties
    
    var types: [String] = ["Running", "Swimming", "Yoga", "Lifting", "Soccer"]
    var filteredType: String = ""
    var filteredDate: String = ""
    var filterActivate: Bool {
        !filteredType.isEmpty || !filteredDate.isEmpty
    }
    
    // MARK: - Internal interface
    
    func clearFilter() {
        filteredType = ""
        filteredDate = ""
    }
}
