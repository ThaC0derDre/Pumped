//
//  TimeRow.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/22/22.
//

import SwiftUI

struct TimeRow: View {
    @State private var startTime    = ""
    @State private var duration     = 12
    @State private var date         = ""
    @State private var xDuration:Int?    = 13
    
    var body: some View {
        VStack{
            Text(date)
            HStack{
                Text(startTime)
                
                Text("\(duration)")
                
            }
            if xDuration != nil {
            Text("Other Time: \(xDuration)")
            }
        }
    }
}

struct TimeRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeRow()
    }
}
