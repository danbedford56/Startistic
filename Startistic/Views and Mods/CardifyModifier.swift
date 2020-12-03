//
//  CardifyModifier.swift
//  PracticeSwiftUI
//
//  Created by Dan Bedford on 25/11/2020.
//

import SwiftUI
import Foundation

struct Cardify: AnimatableModifier {
    
    var rotation: Double
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 360

    }
    
    func body(content: Content) -> some View {
        VStack {
            if isFaceUp {
                ZStack{
                    RoundedRectangle(cornerRadius: cornerRadius).fill().scaledToFill()
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).scaledToFill()
                    content
                }

            }
        
            else {
                ZStack{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    content
                }
                
            }

            
        }
        
            .rotation3DEffect(
                Angle.degrees(rotation),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        
        
    }
    
    // MARK: Drawing constants
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View{
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

