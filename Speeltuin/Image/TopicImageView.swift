//
//  TopicImageView.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//
import SwiftUI

struct TopicImageView: View {
    let topic = Topic(name: "Images", description: "Image, Async Image, Tap, Zoom", image: "photo")
    @State private var zoom = false
    var body: some View {
        BaseTopicView(topic: topic) {
        
            VStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                Image("example")
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
                        .aspectRatio(contentMode: zoom ? .fill : .fit)
                        .onTapGesture {
                            withAnimation { zoom.toggle()
                            }
                        }
                } placeholder: {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TopicImageView()
    }
}
