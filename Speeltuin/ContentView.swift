//
//  ContentView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//
import SwiftUI

enum TopicViewType {
    case text, list, image
    
    var view: some View {
        switch self {
        case .text:
            return AnyView(TopicTextView())
        case .list:
            return AnyView(TopicListView())
        case .image:
            return AnyView(TopicImageView())
        }
    }
    
    var topic: Topic {
        switch self {
        case .text:
            return Topic(name: "Textbox", description: "Text, TextEditor, TextField, SecureField", image: "rectangle.and.pencil.and.ellipsis")
        case .list:
            return Topic(name: "List", description: "This is a list", image: "list.dash.header.rectangle")
        case .image:
            return Topic(name: "Images", description: "Image, Async Image", image: "photo")
        }
    }
}

struct ContentView: View {
    let topics: [TopicViewType] = [.text, .list, .image]

    var body: some View {
        NavigationStack {
            List(0..<topics.count, id: \.self) { index in
                let topicView = topics[index]
                
                NavigationLink(destination: topicView.view) {
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
