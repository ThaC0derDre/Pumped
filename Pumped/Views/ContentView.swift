//
//  ContentView.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var lStartTime   = ""
    @State private var rStartTime   = ""
    @State private var lfDuration   = 6
    @State private var rtDuration   = 6
    @State private var pumpAmount   = 10
    @State private var rTrackButton = "Track"
    @State private var lTrackButton = "Track"
    @State private var clickLabel   = "Click to track time"
    
    @State private var sameTime     = true
    
    
    
    var body: some View {
        NavigationView{
            List {
                Section {
                    HStack {
                        Text(clickLabel)
                            .padding(.leading)
                        Spacer()
                        Button("\(lTrackButton)") {
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
                    
                }header: {
                    if !sameTime {
                        Text("First Side")
                    }else{
                        Text("")
                    }
                }
                
                if !sameTime {
                    VStack{
                        Text("Match durations")
                        
                    
                    }
                }
            }
        }
        .navigationTitle("Pump")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func getTimeFor(_ side: String) {
        let currentTime = Date.now
        if side == "left" {
            lStartTime = currentTime.formatted(date: .omitted, time: .shortened)
            lTrackButton = lStartTime
            clickLabel = "Started at"
        } else {
            rStartTime = currentTime.formatted(date: .omitted, time: .shortened)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
