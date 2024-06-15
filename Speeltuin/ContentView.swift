//
//  ContentView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI


struct ContentView: View {
    var topicViews: [any BaseTopicView] = [
        TopicTextView(),
        TopicImageView(),
        TopicListView()
    ]

    var body: some View {
        NavigationStack {
            List(0..<topicViews.count, id: \.self) { index in
                let topicView = topicViews[index]
                
                NavigationLink(destination: AnyView(topicView)) {
                    HStack {
                        Image(systemName: topicView.topic.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                        Text(topicView.topic.name)
                    }
                }
            }
            .navigationTitle("Topics")
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
