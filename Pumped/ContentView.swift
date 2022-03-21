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
