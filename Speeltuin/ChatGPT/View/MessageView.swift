//
//  MessageView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 23.06.24.
//

import SwiftUI

struct MessageView: View {
    let chat: Chat
    var body: some View {
        HStack {
            if chat.sender == .me { Spacer() }
            Text(chat.content)
                .foregroundColor(chat.sender == .me ? Color.white : nil)
                .padding()
                .background(chat.sender == .me ? Color.blue : Color.gray.opacity(0.2))
                .cornerRadius(25)
            if chat.sender == .chatGPT { Spacer() }
        }
    }
}

#Preview {
    MessageView(chat: Chat(id: UUID().uuidString, content: "Hello", createAt: Date(), sender: .me))
}
