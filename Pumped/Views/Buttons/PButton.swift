//
//  PButton.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/21/22.
//

import SwiftUI

struct PButton: View {
    @State private var someText = "Save"
    @State private var saved    = false
    
    var body: some View {
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
                saved = true
                withAnimation {
                    someText = "Saved"
                }
            }
            .foregroundColor(.clear)
            .padding()
            
        }
        
    }
    
    
    struct PButton_Previews: PreviewProvider {
        static var previews: some View {
            PButton()
        }
    }
}
