//
//  DetailView.swift
//  H4X0R News
//
//  Created by Matthew Musgrove on 3/14/20.
//  Copyright © 2020 Matthew Musgrove. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}


