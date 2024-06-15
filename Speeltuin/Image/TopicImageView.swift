//
//  TopicImageView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//

import SwiftUI

struct TopicImageView: BaseTopicView {
    let topic =  Topic(name: "Images", description: "Image, Async Image", image: "photo")
    var body: some View {
        Text(topic.description)
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.yellow)
        Image(ImageResource.example)
            .resizable()
            .frame(width: 100, height: 100)
        Image("example")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.red, lineWidth: 4))
            .shadow(radius: 10)
        AsyncImage(url: URL(string: "https://picsum.photos/200")!) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView("Loading...")
        }.navigationTitle(topic.name)
    }
}

#Preview {
    NavigationStack {
        TopicImageView()
    }
}
