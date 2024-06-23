//
//  ChatGPTView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 22/06/2024.
//

import SwiftUI

struct ChatGPTView: View {
    let topic = Topic(name: "SwiftUI ChatGPT", description: "Using ChatGPT API and MV Pattern. Consuming JSON", image: "chatGPT", isSystemImage: false)
    @State private var message = ""
    @State private var chats: [Chat] = Chat.sampleChat
    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(chats, id: \.id) { chat in
                            MessageView(chat: chat)
                        }
                    }
                }
                Divider().padding(.bottom, 10)
                HStack {
                    TextField("Enter your message", text: $message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(25)

                        .onSubmit {
                        }
                    Button {
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.largeTitle)
                            .padding(.horizontal, 5)
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    NavigationStack {
        ChatGPTView()
    }
}
