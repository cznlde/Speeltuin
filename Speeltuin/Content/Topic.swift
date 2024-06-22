//
//  Topic.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 15.06.24.
//
import SwiftUI
import Foundation
struct Topic: Identifiable , Hashable{
    static func == (lhs: Topic, rhs: Topic) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var description: String
   
    var image: String
    var isSystemImage: Bool = true
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
 

protocol TopicProvidable {
    var topic: Topic { get }
}
