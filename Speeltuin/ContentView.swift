//
//  ContentView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.

import SwiftUI

struct ContentView: View {
    let topicViews: [(view: AnyView, topic: Topic)] = [
        (AnyView(TopicTextView()), TopicTextView().topic),
        (AnyView(TopicListView()), TopicListView().topic),
        (AnyView(TopicImageView()), TopicImageView().topic),
        (AnyView(TopicStateView()), TopicStateView().topic),
        (AnyView(WeatherView()), WeatherView().topic),
        (AnyView(ChatGPTView()), ChatGPTView().topic),
    ]
    
    var body: some View {
        NavigationStack {
            List(0 ..< topicViews.count, id: \.self) { index in
                let topicView = topicViews[index]
                
                NavigationLink(destination: topicView.view) {
                    HStack { if topicView.topic.isSystemImage {
                        Image(systemName: topicView.topic.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                    }
                    else {
                        Image(topicView.topic.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                    }
                        
                    Text(topicView.topic.name)
                    }
                }
            }
            .navigationTitle("Topics")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EnvironmentViewNew()
                        .padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EnvironmentViewOld()
                        .padding()
                }
            }
        }
    }
}

/// Comment:
/// Ensure that the environment objects (`MyModelOld` and `MyModel`) are injected in the preview,
/// even if they are only used in subviews. This prevents crashes in the preview because SwiftUI
/// requires all environment dependencies to be correctly set up in the preview context.
/// Without these injections, the preview will crash because the required environment objects
/// are not available in the view hierarchy.
///
#Preview {
    ContentView()
        // inject the model into the environment. This is only for the preview.
        // in the app, the model is injected in the `SpeeltuinApp` struct.
        .environmentObject(MyModelOld()) // pre iOS 17
        .environment(MyModel()) // iOS 17 and newer
}
