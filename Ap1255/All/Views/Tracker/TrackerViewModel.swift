//
//  TrackerViewModel.swift
//  Ap1255
//
//  Created by IGOR on 29/03/2025.
//

import SwiftUI
import CoreData

final class TrackerViewModel: ObservableObject {
    
    @AppStorage("goals") var goals: String = ""
    @AppStorage("matches") var matches: String = ""
    @AppStorage("Opponents") var Opponents: String = ""

    @Published var addGoal: String = ""
    @Published var addMatch: String = ""
    @Published var addOppo: String = ""

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    @Published var isAddStat: Bool = false

    @Published var tTrain: String = ""
    @Published var tDescr: String = ""
    @Published var tDate: String = ""
    @Published var tPlace: String = ""
    @Published var tTime: String = ""

    @Published var trains: [TrainModel] = []
    @Published var selectedTrain: TrainModel?

    func addTrain() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainModel", into: context) as! TrainModel

        loan.tTrain = tTrain
        loan.tDescr = tDescr
        loan.tDate = tDate
        loan.tPlace = tPlace
        loan.tTime = tTime

        CoreDataStack.shared.saveContext()
    }

    func fetchTrains() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainModel>(entityName: "TrainModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.trains = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.trains = []
        }
    }
}

