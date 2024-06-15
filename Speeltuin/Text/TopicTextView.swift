//
//  TopicTextView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicTextView: BaseTopicView {
    let topic = Topic(name: "Textbox", description: "Text, TextEditor, TextField, SecureField", image: "rectangle.and.pencil.and.ellipsis")
    var body: some View {
        VStack {
            Text(topic.description)
                .font(.title)
                .foregroundColor(.blue)
            Text("First line")
                .foregroundColor(.cyan)
                .font(.title2)
            Text("Second line")
                .foregroundColor(.green)
                .font(.title2)
        }
        .padding()
        .navigationTitle(topic.name)
    }
}

#Preview {
    NavigationStack {
        TopicTextView()
    }
}
