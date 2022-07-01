//
//  ContentView.swift
//  OnMagnification
//
//  Created by Skorobogatow, Christian on 1/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            HStack{
                Circle().frame(width: 35, height: 35)
                Text("@Christiansko")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        })
            
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            
            Text("This is the caption")
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
