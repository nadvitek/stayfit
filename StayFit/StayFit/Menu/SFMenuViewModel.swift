import Foundation

protocol SFMenuViewModeling {
    var types: [String] { get }
    var filteredType: String { get set }
    var filteredDate: String { get set }
    var filterActivate: Bool { get }
    
    func clearFilter()
}

@Observable
class SFMenuViewModel: SFMenuViewModeling {
    
    // MARK: - Internal properties
    
    var types: [String] = ["Running", "Swimming", "Yoga", "Lifting", "Soccer"]
    var filteredType: String = ""
    var filteredDate: String = ""
    var filterActivate: Bool {
        !filteredType.isEmpty || !filteredDate.isEmpty
    }
    
    // MARK: - Internal interface
    
    func clearFilter() {
        filteredDate = ""
        filteredType = ""
    }
}
