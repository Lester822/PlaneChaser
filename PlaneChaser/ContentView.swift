//
//  ContentView.swift
//  PlaneChaser
//
//  Created by Recon Dev on 3/31/23.
//

import SwiftUI

let randomInt = Int.random(in: 1..<78)
var used = [String]()

struct ContentView: View {
    @State var random_plane: String = chooseRandomImage()
    @State var final_roll: String = "dice_icon"
    var body: some View {
        ZStack {
            Image("background")
                .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            HStack {
                Image(self.random_plane)
                    .padding()
                    .frame(width: 600.0, height: 10.0)
                    .rotationEffect(.degrees(90))
                    .scaleEffect(0.4)
                VStack {
                    Button(action: {
                        used = [String]()
                    }) {
                        Image("recycle_icon")
                    }
                    Button(action: {
                        self.random_plane = chooseRandomImage()
                    }) {
                        Image("planeswalk")
                    }
                    Button(action: {
                        let die_roll = rollDie()
                        if die_roll == 6 {
                            self.final_roll = "Dice_Chaos_Icon"
                        } else if die_roll == 1 {
                            self.final_roll = "Dice_Plane_Icon"
                        } else {
                            self.final_roll = "dice_icon"
                        }
                        
                    }) {
                        Image(self.final_roll)
                    }
                }
            }
        }
        .padding(.top, 21.0)
        
    }
}


func chooseRandomImage() -> String {
    var result = ""
    if used.count == 86 {
        used = [String]()
        return "plane"
    }
    while used.contains(result) {
        result = String(Int.random(in: 1..<87))
    }

    used.append(result)

    return result
}


func rollDie() -> Int {
    
    let result = Int.random(in:1..<7)
    
    return result
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
