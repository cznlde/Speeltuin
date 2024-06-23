//
//  Chat.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 23.06.24.
//

import Foundation
struct Chat {
    let id: String
    let content: String
    let createAt: Date
    let sender: Sender
}

enum Sender {
    case me
    case chatGPT
}

// sample data
extension Chat{
  static  let sampleChat: [Chat] = [
        Chat(id: UUID().uuidString, content: "Hello", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "Hi", createAt: Date(), sender: .chatGPT),
        Chat(id: UUID().uuidString, content: "How are you?", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "I'm fine", createAt: Date(), sender: .chatGPT),
        Chat(id: UUID().uuidString, content: "What are you doing?", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "I'm chatting with you", createAt: Date(), sender: .chatGPT),
        Chat(id: UUID().uuidString, content: "What is your name?", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "I'm ChatGPT", createAt: Date(), sender: .chatGPT),
        Chat(id: UUID().uuidString, content: "Nice to meet you", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "Nice to meet you too", createAt: Date(), sender: .chatGPT),
        Chat(id: UUID().uuidString, content: "Goodbye", createAt: Date(), sender: .me),
        Chat(id: UUID().uuidString, content: "Goodbye", createAt: Date(), sender: .chatGPT)]
}
