//
//  SwiftDataVIew.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 30.06.24.
//

import SwiftData
import SwiftUI
import UniformTypeIdentifiers

struct SwiftDataVIew: View {
    @Environment(\.dismiss) var dismiss
    @Query var chats: [SwiftDataModel]
    @State var showCopy = false
    @Environment(\.modelContext) var modelContext

    var body: some View {
        ZStack {
            List {
                ForEach(chats) {
                    chat in

                    DisclosureGroup(chat.question) {
                        Text(chat.answer)
                            .onTapGesture {
                                copyAnswer(text: chat.answer)
                            }
                            .padding()
                    }
                    .swipeActions{
                        deleteChat(chat: chat)
                    }
                }
            }
            if showCopy {
                clipboard
            }
        }
        .navigationTitle("Swift Data")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .tint(.black)
                }
            }
        }
    }

    @ViewBuilder func deleteChat(chat: SwiftDataModel) -> some View {
        VStack { Button {
            modelContext.delete(chat)

        } label: {
            Label("Delete", systemImage: "trash")
        }
        .tint(.red)
        }
    }

    // MARK: - Helpers

    private func copyAnswer(text: String) {
        UIPasteboard.general.string = text
        showCopy = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showCopy = false
        }
    }

    var clipboard: some View {
        VStack {
            Text("Clipboard: \(UIPasteboard.general.string ?? "")")
                .padding()
                .background(Color.red.opacity(0.2).cornerRadius(20))
                .foregroundStyle(Color.white)
            Spacer()
        }
    }
}

#Preview {
    NavigationView {
        SwiftDataVIew()
    }
}
