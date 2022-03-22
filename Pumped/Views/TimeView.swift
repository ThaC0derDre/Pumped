//
//  TimeView.swift
//  Pumped
//
//  Created by Andres Gutierrez on 3/22/22.
//

import SwiftUI
import RealmSwift

struct TimeView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack{
            Text("My times")
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            List{
                ForEach(realmManager.times, id: \.id) {
                    time in
                    // add row
                }
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
            .environmentObject(RealmManager())
    }
}
