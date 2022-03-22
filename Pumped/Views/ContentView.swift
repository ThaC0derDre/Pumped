//
//  ContentView.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var lStartTime   = ""
    @State private var pumpAmount   = 10
    @State private var trackButton  = "Track"
    @State private var clickLabel   = "Click to track time"
    
    @State private var sameTime     = true
    
    
    
    var body: some View {
        VStack{
            List {
                
                Section {
                    TrackerSection(trackLabel: clickLabel, trackButton: trackButton, startTime: lStartTime)
                    VStack{
                        MinutesPumpSection(pumpTime: pumpAmount)
                        HStack{
                            Section{
                                Toggle("Match Duration?", isOn: $sameTime)
                            }
                        }
                    }
                }header: {
                    if !sameTime {
                        Text("FIRST SIDE")
                    }else{
                        Text("")
                    }
                }
                
                if !sameTime {
                    Section{
                        MinutesPumpSection(pumpTime: pumpAmount)
                    }header: {
                        Text("OTHER SIDE")
                    }
                }
            }
            .navigationTitle("Pump")
            .navigationBarTitleDisplayMode(.inline)
            PButton()
                .padding(.bottom)
            
        }
        .preferredColorScheme(.dark)
    }
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
