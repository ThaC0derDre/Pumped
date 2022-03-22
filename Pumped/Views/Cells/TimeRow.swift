//
//  TimeRow.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/22/22.
//

import SwiftUI

struct TimeRow: View {
    @State var startTime: String
    @State var duration: Int
    @State var date: String
    @State var xDuration:Int?
    
    var body: some View {
        VStack{
            Text(date)
                .font(.title2.bold())
                
                
            HStack{
                Spacer()
                Text("Started at \(startTime)")
                Spacer()
                Spacer()
                if xDuration != nil {
                    VStack(){
                    Text("First side: \(duration) Mins")
                        Text("Other side: \(xDuration!) Mins")
                    }
                } else {
                    Text("\(duration) Mins each ")
                    Spacer()
                }
            }
        }
    }
}

struct TimeRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeRow(startTime: "12:00pm", duration: 15, date: "Monday, 15", xDuration: 17)
    }
}
