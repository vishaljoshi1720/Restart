//
//  ContentView.swift
//  Restart
//
//  Created by Vishal Joshi on 07/12/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingActive {
                OnboradingView()
            }else{
                HomeView()
            }
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
