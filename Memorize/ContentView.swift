//
//  ContentView.swift
//  Memorize
//
//  Created by Matthew Kang on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    //could also be written as var isFaceUp = false
    //because SwiftUI is a strongly typed language, it infers your variables with what you set it equal to
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
            else {
                    base.foregroundColor(.red)
                    base.strokeBorder(lineWidth: 2)
            }
        }
        .onTapGesture {
            print("working")
            isFaceUp = !isFaceUp
            
        }
    }
}












#Preview {
    ContentView()
}
