//
//  ContentView.swift
//  Matthew Card
//
//  Created by Matthew Musgrove on 3/13/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(UIColor(red:0.16, green:0.50, blue:0.73, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Matthew")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Matthew Musgrove")
                    .font(Font.custom("RedHatDisplay-Regular", size: 40.0))
                    .bold()
                    .foregroundColor(.white)
                Text("Computer Engineer")
                    .foregroundColor(.white)
                    .font(Font.custom("RedHatDisplay-Regular", size: 25.0))
                Divider()
                InfoView(text: "(512) 568 - 2997", imageName: "phone.fill")
                InfoView(text: "mmusg24@gmail.com", imageName: "envelope.fill")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


