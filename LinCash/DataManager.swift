import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LinCash")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // Fetch daily balances for the current month
    func fetchDailyBalances(for month: Date, completion: @escaping ([String: Double]) -> Void) {
        // Simulate fetching data from a backend or database
        let dummyData: [String: Double] = [
            "2025-02-01": 100.0,
            "2025-02-02": -50.0,
            "2025-02-03": 200.0
        ]
        completion(dummyData)
    }
    
    // Fetch income and expenditure data for the last four months
    func fetchMonthlyData(completion: @escaping ([(month: String, income: Double, expenditure: Double)]) -> Void) {
        // Simulate fetching data from a backend or database
        let dummyData: [(String, Double, Double)] = [
            ("2025-11", 3000.0, 2500.0),
            ("2025-12", 3200.0, 2700.0),
            ("2026-01", 3100.0, 2600.0),
            ("2026-02", 3300.0, 2800.0)
        ]
        completion(dummyData)
    }
} 