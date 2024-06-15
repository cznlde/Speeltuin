//
//  TopicStateViewList.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//
import SwiftUI

struct TopicStateViewList: View, TopicProvidable {
    let topic = Topic(name: "Binding", description: "@State, Binding", image: "at")

    @State private var search: String = ""
    @State private var groceryItem: String = ""
    @State private var groceryList: [String] = []
    @State private var groceryListFiltered: [String] = []

    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        VStack {
            BaseTopicView(topic: topic) {
                List(groceryListFiltered, id: \.self) { item in
                    Text(item)
                }
                .listStyle(.plain)
                .searchable(text: $search)
                .onChange(of: search) {
                    filterGroceryList()
                }
                TextField("Enter grocery item", text: $groceryItem)
                    .textFieldStyle(.roundedBorder)
                    .focused($isTextFieldFocused)
                    .onSubmit {
                        addItem()
                    }
            }
        }
        .padding()
        .onAppear {
            groceryListFiltered = groceryList
            isTextFieldFocused = true // Ensure the text field is focused when the view appears
        }
    }

    private func filterGroceryList() {
        if search.isEmpty {
            groceryListFiltered = groceryList
        } else {
            groceryListFiltered = groceryList.filter {
                $0.lowercased().contains(search.lowercased())
            }
        }
    }

    private func addItem() {
        if !groceryItem.trimmingCharacters(in: .whitespaces).isEmpty {
            groceryList.append(groceryItem)
            groceryItem = ""
            groceryListFiltered = groceryList
        }
        isTextFieldFocused = true
    }
}

#Preview {
    NavigationStack {
        TopicStateViewList()
    }
}
