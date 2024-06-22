//
//  ChatGPTView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 22/06/2024.
//

import SwiftUI

struct ChatGPTView: View {
    let topic = Topic(name: "ChatGPT", description: "Using ChatGPT API and MV Pattern. Consuming JSON", image:"chatGPT" , isSystemImage: false)
  
    var body: some View {
        BaseTopicView(topic: topic) {
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }}
}

#Preview {
    ChatGPTView()
}
