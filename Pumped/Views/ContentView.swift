//
//  ContentView.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI
import RealmSwift


struct ContentView: View {
    @StateObject var realmManager   = RealmManager()
    @State private var startTime    = ""
    @State private var pumpAmount   = 10
    @State private var xPumpAmount  = 12
    @State private var trackButton  = "Track"
    @State private var clickLabel   = "Click to track time"
    @State private var sameTime     = true
    @State private var showTimeV    = false
    
    @State private var someText = "Save"
    @State private var saved    = false
    
    
    var body: some View {
        List {
            Section {
                TrackerSection(trackLabel: clickLabel, trackButton: trackButton, startTime: startTime)
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
                    MinutesPumpSection(pumpTime: xPumpAmount)
                }header: {
                    Text("OTHER SIDE")
                }
            }
            
            
            Button("Show Previous Times"){
                showTimeV = true
            }
        }
        .navigationTitle("Pump")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showTimeV) {
            TimeView()
                .environmentObject(realmManager)
        }
        
            ZStack{
                HStack{
                    Text(someText)
                        .font(.title2)
                    Image(systemName: saved ? "checkmark.circle" : "circle")
                }
                .foregroundColor(.white)
                .padding(25)
                .background(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
                .cornerRadius(450)
                Button("Save Here"){
                    if startTime != "" {
                    realmManager.addTime(startTime: startTime, duration: pumpAmount, date: getCurrentDate(), xDuration: sameTime ? nil : xPumpAmount)
                        
                    saved = true
                    withAnimation {
                        someText = "Saved"
                    }
                }
                }
                .foregroundColor(.clear)
                .padding()
                
            }
            .padding(.bottom)
    }
}


func getCurrentDate() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat    = "MMM d, EEEE"
        
        let dateString = formatter.string(from: Date())
        print(dateString)
        return dateString
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
