//
//  FlashCard.swift
//  NihongoDaily
//
//  Created by Oli Jacobs on 29/09/2021.
//

import SwiftUI

struct FlashCardView: View {
    
    var wordToDisplay: Word!
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text((wordToDisplay?.kana?.first?.text)!)
                    .font(.largeTitle)
                    .foregroundColor(.black)

//                Text((wordToDisplay?.sense.)!)
//                    .font(.title)
//                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 350, height: 250)
    }
}

struct FlashCardView_Previews: PreviewProvider {
    
    static var word : Word =  {
        var lazyWord = Word(context: PersistenceController.shared.container.viewContext)
        
        lazyWord.kana = []
        
        var kana: Kana = {
            var kana: Kana = Kana(context: PersistenceController.shared.container.viewContext)
            kana.text = "おはよう！"
            return kana
        }()
        
        lazyWord.kana?.append(kana)
        
        return lazyWord
    }()
    
    static var previews: some View {
        FlashCardView(wordToDisplay: word)
    }
}
