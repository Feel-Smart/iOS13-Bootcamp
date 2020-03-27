//
//  InfoView.swift
//  Matthew Card
//
//  Created by Matthew Musgrove on 3/14/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.white)
            .overlay(HStack {
                Image(systemName:imageName)
                    .foregroundColor(Color(UIColor(red:0.16, green:0.50, blue:0.73, alpha: 1.0)))
                Text(text).foregroundColor(Color(.black))
            })
            .frame(height: 50.0)
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text:"Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
