//
//  TopicListView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicListView: BaseTopicView {
    let topic = Topic(name: "List", description: "This is a list", image: "list.dash.header.rectangle")

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TopicListView()
}
