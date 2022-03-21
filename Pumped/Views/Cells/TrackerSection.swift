//
//  TrackerSection.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI

struct TrackerSection: View {
    @State private var trackLabel: String
    @State private var trackButton: String
    @State private var startTime: String
    var body: some View {
        List {
            Section {
                HStack {
                    Text(trackLabel)
                        .padding(.leading)
                    Spacer()
                    Button("\(trackButton)") {
                        // Get current time
                        getTimeFor("left")
                        
                    }
                    
                    
                }
                
                VStack{
                    Text("How many minutes?")
                        .font(.headline)
                    Spacer()
                    Stepper("\(pumpAmount) minutes", value: $pumpAmount, in: 5...30, step: 1, onEditingChanged: { _ in
                        
                    })
                    HStack{
                        Section{
                            
                            Toggle("Match Duration?", isOn: $sameTime)
                        }
                    }
                }
            }
        }
        
    }
    func getTimeFor(_ side: String) {
        let currentTime = Date.now
        if side == "left" {
            startTime = currentTime.formatted(date: .omitted, time: .shortened)
            trackButton = startTime
            trackLabel = "Started at"
            
        }
    }
}
struct TrackerSection_Previews: PreviewProvider {
    static var previews: some View {
        TrackerSection()
    }
}
