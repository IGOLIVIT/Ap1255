//
//  CalendarViewModel.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI
import CoreData

final class CalendarViewModel: ObservableObject {
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false

    @Published var nName: String = ""
    @Published var nT1: String = ""
    @Published var nT2: String = ""
    @Published var nDate: String = ""
    @Published var nCheck: String = ""

    @Published var notes: [NotesModel] = []
    @Published var selectedNote: NotesModel?

    func addNote() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "NotesModel", into: context) as! NotesModel

        loan.nName = nName
        loan.nT1 = nT1
        loan.nT2 = nT2
        loan.nDate = nDate
        loan.nCheck = nCheck

        CoreDataStack.shared.saveContext()
    }

    func fetchNotes() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NotesModel>(entityName: "NotesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.notes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.notes = []
        }
    }
}
