//
//  SmallExample.swift
//  OnMagnification
//
//  Created by Skorobogatow, Christian on 1/7/22.
//

import SwiftUI

struct SmallExample: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        Text("Hello, world!")
            .font(.title)
            .padding(40)
            .background(.red)
            .cornerRadius(10)
            .scaleEffect(1 + currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        currentAmount = value - 1
                    }
                    .onEnded{ value in
                        lastAmount += currentAmount
                        currentAmount = 0
                    }
            )
    }
}

struct SmallExample_Previews: PreviewProvider {
    static var previews: some View {
        SmallExample()
    }
}
