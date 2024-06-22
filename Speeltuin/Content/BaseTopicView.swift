//
//  BaseTopicView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct BaseTopicView<Content: View>: View {
    let topic: Topic
    let content: Content
    
    init(topic: Topic, @ViewBuilder content: () -> Content) {
        self.topic = topic
        self.content = content()
    }
    
    var body: some View {
        VStack {
            // Header
            HStack(alignment: .top) {
                if topic.isSystemImage {
                    Image(systemName: topic.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    .foregroundColor(.blue)}
                else{
                    Image( topic.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    .foregroundColor(.blue)}
     
            Text(topic.description)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding([.leading, .trailing, .bottom])
            Spacer()
        }
        .padding([.leading, .trailing])
        Divider()
        // Specific content
        content
        Spacer()
    }
        .navigationTitle(Text(topic.name))
        .navigationBarTitleDisplayMode(.inline)
}
}

