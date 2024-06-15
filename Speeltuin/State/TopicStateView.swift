//
//  TopicStageVIew.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicStateView: View, TopicProvidable {
    let topic = Topic(name: "Introduction to @State", description: "@State, Binding", image: "list.dash.header.rectangle")
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
            VStack {
                Toggle(isOn: $isOn, label: {
                    Text(isOn ? "On" : "Off")
                })
                .fixedSize() // removes the extra spacing
            }.frame(maxWidth: 200, maxHeight: 100)
                .background(isOn ? Color.yellow : Color.gray)
                .clipShape(Circle())
            Divider()
            TopicStateViewListButton()
        }
    }
}

#Preview {
    NavigationStack {
        TopicStateView()
    }
}
