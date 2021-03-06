//
//  Times.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import Foundation
import RealmSwift

class Times: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var startTime    = ""
    @Persisted var duration: Int
    @Persisted var date         = ""
    @Persisted var xDuration: Int?
    
}
