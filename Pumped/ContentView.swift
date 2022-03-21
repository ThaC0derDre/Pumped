//
//  ContentView.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var lStartTime   = Date()
    @State private var rStartTime   = Date()
    @State private var lfDuration   = Date()
    @State private var rtDuration   = Date()
    
    static var defaultTime: Date {
        var component = DateComponents()
        component.hour      = 7
        component.minute    = 0
        return Calendar.current.date(from: component) ?? Date.now
    }
    
    
    
    
    var body: some View {
        NavigationView{
        List {
            Section {
                
                HStack {
                    Text("Left Side")
                    padding()
                    DatePicker("Select time to wake up", selection: $lStartTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.trailing)
                    
                }
                HStack{
                Text("FINISHED WITH")
                Spacer()
                    Text("15 Mins")
                        .padding(.trailing)
                }
            
            }
            Section {
                HStack {
                    Text("Right Side")
                    padding()
                    DatePicker("Select time to wake up", selection: $rStartTime, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.trailing)
                    
                }
                
                HStack{
                Text("FINISHED WITH")
                Spacer()
                    Text("...")
                        .padding(.trailing)
                }
            }
        }
        .navigationTitle("Pump")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
