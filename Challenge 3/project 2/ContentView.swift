//
//  ContentView.swift
//  project 2
//
//  Created by Anisha Lamichhane on 3/29/21.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color .black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK"].shuffled()
    
    @State private var showingScore  = false
    @State private var scoreTitle = ""
    @State private var score = 0 //Challenge 1
   
   @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        
        ZStack {
//            Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors:[.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                
                VStack {
                    Text("Tap the flag of :")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                    
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    
                }
                
                ForEach(0 ..< 3){
                    number in
                    Button(action: {
                        //flag was tapped
                        self.flagTapped(number)
                        
                        
                    }) {
                        FlagImage(name: self.countries[number])
                    }
                }
                
//                challenge 2
                VStack (spacing: 150){
                    Text("Total Score: \(score)")
                        .foregroundColor(.white)
                        .fontWeight(.black)
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
//    challenge 1
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 5
        } else {
            scoreTitle = "Wrong!! that is the flag of \(countries[number])"  // challenge 3
            score -= 3
        }
        showingScore = true
    }
    
   func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
