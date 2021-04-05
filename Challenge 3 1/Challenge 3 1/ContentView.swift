//
//  ContentView.swift
//  Challenge 3 1
//
//  Created by Anisha Lamichhane on 4/5/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .background(Color.black)
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .modifier(Title())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
