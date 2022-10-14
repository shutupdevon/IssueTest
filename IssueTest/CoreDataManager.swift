//
//  CoreData.swift
//  IssueTest
//
//  Created by George Tchelidze on 14.10.22.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private var container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { description, error in
            if let error {
                print("Error loading: \(error.localizedDescription)")
            }
        }
    }
    
  
}
