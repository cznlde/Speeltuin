//
//  TopicTextView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicTextView: View,TopicProvidable {
    let topic = Topic(name: "Textbox", description: "Text, TextEditor, TextField, SecureField", image: "rectangle.and.pencil.and.ellipsis")

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                Text("First line")
                    .foregroundColor(.cyan)
                    .font(.largeTitle)
                Text("Second line")
                    .foregroundColor(.green)
                    .font(.title2)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TopicTextView()
    }
}

