//
//  TrackerSection.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI

struct TrackerSection: View {
    @State var trackLabel: String
    @State var trackButton: String
    @State var startTime: String
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
                    .padding(.trailing)
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
        TrackerSection(trackLabel: "Click to start time", trackButton: "Get Time", startTime: "12:pm")
    }
}
