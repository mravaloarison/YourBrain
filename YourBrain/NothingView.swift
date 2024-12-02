//
//  NothingView.swift
//  YourBrain
//
//  Created by Mami Ravaloarison on 12/1/24.
//

import SwiftUI

struct NothingView: View {
    // MAKE A CALL: api.giphy.com/v1/gifs/search?api_key=&q=who
    
    // GEMINI:
    
    let url = URL(string:"https://giphy.com/embed/EkHbiqD1yu6Wc")!
    
    var body: some View {
        GifImageView(url: url)
    }
}

#Preview {
    NothingView()
}
