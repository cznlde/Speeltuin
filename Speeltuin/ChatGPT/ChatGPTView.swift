//
//  ChatGPTView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 22/06/2024.
//

import SwiftUI

struct ChatGPTView: View {
    let topic = Topic(name: "SwiftUI ChatGPT", description: "Using ChatGPT API and MV Pattern. Consuming JSON", image: "message", isSystemImage: true)
    @State private var message = ""
    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
                if chatViewModel.chats.isEmpty {
                    emptyView
                } else {
                    ScrollViewReader { scrollViewProxy in
                        ScrollView {
                            LazyVStack {
                                ForEach(chatViewModel.chats, id: \.id) { chat in
                                    MessageView(chat: chat)
                                        .id(chat.id) // Assign an id to each chat view
                                }
                                if chatViewModel.isLoading {
                                    ProgressView()
                                }
                            }
                        }
                        .onChange(of: chatViewModel.chats.count) {
                            // Scroll to the last chat when a new chat is added
                            if let lastChat = chatViewModel.chats.last {
                                withAnimation {
                                    scrollViewProxy.scrollTo(lastChat.id, anchor: .bottom)
                                }
                            }
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
                            Task {
                                await sendMessage()
                            }
                        }
                    
                    Button {
                        Task {
                            await sendMessage()
                        }
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.largeTitle)
                            .padding(.horizontal, 5)
                            .foregroundColor(.blue)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding()
            .toolbar(content: {
                if !chatViewModel.chats.isEmpty {  ToolbarItem( placement: .topBarLeading) {
                    Button {
                        chatViewModel.chats.removeAll()
                    } label: {
                        Image(systemName: "trash")
                            .font(.caption)
                        Text("Clear")
                    }}
                }
            }
            )
        }
    }
    
    // MARK: - Helpers
    
    func sendMessage() async {
        guard !message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let chat = Chat(id: UUID().uuidString, content: message, createAt: Date(), sender: .me)
        chatViewModel.chats.append(chat)
        message = ""
        guard  let chatGPT = await chatViewModel.sendMessage(message: chat.content) else { return }
        if (chatGPT.content ).isEmpty {
            chatViewModel.chats.removeAll(where: { $0.id == chat.id })
        }
    }
    
    var  progressView: some View {
        ProgressView()
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
    }
    // MARK: emptyView
    
    var emptyView: some View {
        VStack{
            Spacer()
            ZStack {
                Color(.gray.opacity(0.1))
                    .cornerRadius(25)
                    .padding()
                VStack {
                    Image(systemName: "message.fill")
                        .font(.largeTitle)
                        .padding()
                    Text("There is no chat, click down to type a new message.")
                        .font(.title)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                .foregroundStyle(Color.gray)
            }
            .frame(height: 300)
            .padding(.bottom)
        }
    }
}

#Preview {
    NavigationStack {
        ChatGPTView()
    }
}
