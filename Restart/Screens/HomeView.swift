//
//  HomeView.swift
//  Restart
//
//  Created by Vishal Joshi on 07/12/21.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = false
    
    @State private var isAnimatiing : Bool = false

    var body: some View {
            VStack(spacing:20) {
                
                Spacer()
                
                ZStack{
                    CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .offset(y: isAnimatiing ? 35 : -35 )
                        .animation(
                            Animation
                                .easeOut(duration: 4)
                                .repeatForever()
                                ,value: isAnimatiing
                        )
                }
                
                
                Text( """
                The time that leads to mastery is
                dependent on the intensity of our
                focus
                """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action:{
                    playSound(sound: "success", type: "m4a")
                    withAnimation{
                        isOnboardingActive=true
                    }
                    
                }){
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3,design:.rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                     isAnimatiing=true
                })
            })
        }
       
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
