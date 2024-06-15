//
//  TopicStateViewListButton.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI
struct TopicStateViewListButton: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: TopicStateViewList()) {
                    Text("Search List with TextEditor and @State")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Back")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TopicStateViewListButton()
}
