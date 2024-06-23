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
    @StateObject private var chatViewModel = ChatViewModel()

    var body: some View {
        BaseTopicView(topic: topic) {
            VStack {
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
        }
    }

        // MARK: - Helpers
       
    func sendMessage() async {
        guard !message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let chat = Chat(id: UUID().uuidString, content: message, createAt: Date(), sender: .me)
        chatViewModel.chats.append(chat)
        message = ""
        let _ = await chatViewModel.sendMessage(message: chat.content)
        // TODO: ....
    }
        
        var  progressView: some View {
            ProgressView()
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
}

#Preview {
    NavigationStack {
        ChatGPTView()
    }
}
