//
//  TopicStageVIew.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicStateView: View, TopicProvidable {
    let topic = Topic(name: "Introduction to @State", description: "@State, Binding, @Observable, ObservableObject", image: "list.dash.header.rectangle")
    @State private var count: Int = 1
    @State private var isOn: Bool = false

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                Text("\(count)")
                    .font(.title)
                    .foregroundColor(.blue)
                Button("Increment") {
                    count += 1
                }
            }
            Divider()
            HStack { VStack {
                HStack {
                    Toggle(isOn: $isOn, label: {
                        Text(isOn ? "On" : "Off")
                    })
                    .fixedSize()
                } // removes the extra spacing
            }.frame(maxWidth: 200, maxHeight: 100)
                .background(isOn ? Color.yellow : Color.gray)
                .clipShape(Circle())
            }
            Divider()
            EnvironmentViewOld()
            EnvironmentViewNew()
            Divider()
            TopicStateViewListButton()
        }
    }
}



/// Comment:
/// Ensure that the environment objects (`MyModelOld` and `MyModel`) are injected in the preview,
/// even if they are only used in subviews. This prevents crashes in the preview because SwiftUI
/// requires all environment dependencies to be correctly set up in the preview context.
/// Without these injections, the preview will crash because the required environment objects
/// are not available in the view hierarchy.

#Preview {
    NavigationStack {
        TopicStateView()
            .environmentObject(MyModelOld())
            .environment(MyModel())
    }
}
