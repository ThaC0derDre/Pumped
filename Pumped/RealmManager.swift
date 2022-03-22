//
//  RealmManager.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var times:[Times] = []
    
    init () {
        openRealm()
    }
    
    func openRealm() {
        do{
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm  = try Realm()
        }catch{
            print("Error opening Realm: \(error)")
        }
    }
    
    
    func addTime(startTime: String, duration: String, date: String, xDuration: String?) {
        
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTime = Times(value: ["startTime": startTime, "duration": duration, "date": date, "xDuration": xDuration])
                    localRealm.add(newTime)
                    getTimes()
                }
            }catch {
                print("Error saving time: \(error)")
            }
        }
        
    }
    
    
    func getTimes() {
        if let localRealm = localRealm {
            let allTimes = localRealm.objects(Times.self).sorted(byKeyPath: "date", ascending: true)
            times = []
            allTimes.forEach { time in
                times.append(time)
            }
        }
    }
    
    func updateTimes(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let timeToUpdate = localRealm.objects(Times.self).filter(NSPredicate(format: "id == %@", id))
                guard timeToUpdate.isEmpty else { return }
                
                //continue realm adventures here...
            }
        }
    }
}
