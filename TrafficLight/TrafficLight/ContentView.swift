//
//  ContentView.swift
//  TrafficLight
//
//  Created by Тадевос Курдоглян on 07.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var stateTrafficLight = 0
    
    @State private var redAlpha = 0.3
    @State private var yellowAlpha = 0.3
    @State private var greenAlpha = 0.3
    
    @State private var buttonText = "Start"
    
    var body: some View {
        VStack {
            ColorCircle(color: .red.opacity(redAlpha))
                .padding(.top)
            ColorCircle(color: .yellow.opacity(yellowAlpha))
            ColorCircle(color: .green.opacity(greenAlpha))
            Spacer()
            Button(action: {
                    startButtonTapped()
                }, label: {
                    Text(buttonText)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: 150, height: 75)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 3)
                                .background(Color.blue.cornerRadius(10).shadow(radius: 10))
                        )
                        
                })
        }
    }
    
    private func startButtonTapped() {
        buttonText = "Next"
        stateTrafficLight += 1
        if stateTrafficLight > 3 {
            stateTrafficLight = 1
        }
        redAlpha = stateTrafficLight == 1 ? 1.0 : 0.3
        yellowAlpha = stateTrafficLight == 2 ? 1.0 : 0.3
        greenAlpha = stateTrafficLight == 3 ? 1.0 : 0.3
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
