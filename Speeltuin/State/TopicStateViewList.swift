//
//  TopicStateViewList.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI
struct TopicStateViewList: View, TopicProvidable {
    
    let topic = Topic(name: "Binding", description: "@State, Binding", image: "at")
 
    @State private var name: String = ""

    var body: some View {
        VStack {
            BaseTopicView(topic: topic) {
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }}
    }
}



 
#Preview {
    NavigationStack {
        TopicStateViewList()
    }
}
