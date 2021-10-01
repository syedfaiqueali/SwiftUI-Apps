//
//  Persistence.swift
//  Devote
//
//  Created by Faiq on 30/09/2021.
//

import CoreData

struct PersistenceController {
    // MARK:- 1. PERSISTENT CONTROLLER
    /**
      - Singleton to use it in the entire app
      - Sets up the model context and store coordinator
     */
    static let shared = PersistenceController()

    // MARK:- 2. PERSISTENT CONTAINER
    /**
      - Storage property for coredata
      - Use it to initialize our core data stack and load our core data model
     */
    let container: NSPersistentContainer

    // MARK:- 3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    // MARK:- 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
        }
        do {
            try viewContext.save()  //Save data to the memory
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
