//
//  ContentView.swift
//  Memorize
//
//  Created by Matthew Kang on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "😂", "😔", "🙏", "😐", "🥺", "😒", "😳"]
    @ State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView {
                cards
            }

                cardCountAdjuster
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(0..<cardCount, id: \.self) {
                index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
    }
    
    var cardCountAdjuster: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    //could also be written as var isFaceUp = false
    //because SwiftUI is a strongly typed language, it infers your variables with what you set it equal to
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.foregroundColor(.red).opacity(isFaceUp ? 0 : 1)
            base.strokeBorder(lineWidth: 2)
        }
        .onTapGesture {
            isFaceUp.toggle()
            
        }
    }
}












#Preview {
    ContentView()
}
