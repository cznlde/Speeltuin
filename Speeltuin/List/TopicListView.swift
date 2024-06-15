//
//  TopicListView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//
import SwiftUI

struct TopicListView: View {
    let topic = Topic(name: "List", description: "This is a list", image: "list.dash.header.rectangle")

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                Text("List View")
                    .font(.title)
                    .foregroundColor(.blue)
                // Voeg hier meer inhoud voor de lijstweergave toe
            }
        }
    }
}

#Preview {
    NavigationStack {
        TopicListView()
    }
}
