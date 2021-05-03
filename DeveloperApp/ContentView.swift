//
//  ContentView.swift
//  DeveloperApp
//
//  Created by Aviral on 26/04/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    
    //MARK: - body
    var body: some View {
        TabView {
            ForEach(dataDevelopers){ developer in
                CardView(developer: developer)
            }
        }.tabViewStyle(PageTabViewStyle())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
