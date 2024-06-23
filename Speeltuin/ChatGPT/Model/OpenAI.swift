//
//  OpenAI.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 23.06.24.
//

import Foundation

struct OpenAI: Decodable {
    let id: String
    let choices: [OpenAIResponseChoices]
}
struct OpenAIResponseChoices: Decodable{
    let text: String // answer
}
//TODO: -body
 
struct OpenAIBody: Encodable {
    let model: String
    let messages: [Message]
    let temperature: Float?
    let max_tokens: Int
}

//curl https://api.openai.com/v1/chat/completions   -H "Content-Type: application/json"   -H "Authorization: Bearer sk-proj-......"   -d '{
//    "model": "gpt-3.5-turbo",
//    "messages": [
//      {
//        "role": "system",
//        "content": "You are a poetic assistant, skilled in explaining complex programming concepts with creative flair."
//      },
//      {
//        "role": "user",
//        "content": "Compose a poem that explains the concept of recursion in programming."
//      }
//    ]
//  }'


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
import Foundation

// MARK: - OpenAIResponse
struct OpenAIResponse: Codable {
    let id, object: String
    let created: Int
    let model: String
    let choices: [Choice]
    let usage: Usage
    let systemFingerprint: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, object, created, model, choices, usage
        case systemFingerprint = "system_fingerprint"
    }
}

// MARK: - Choice
struct Choice: Codable {
    let index: Int
    let message: Message
    let logprobs: JSONNull?
    let finishReason: String

    enum CodingKeys: String, CodingKey {
        case index, message, logprobs
        case finishReason = "finish_reason"
    }
}

// MARK: - Message
struct Message: Codable {
    let role, content: String
}

// MARK: - Usage
struct Usage: Codable {
    let promptTokens, completionTokens, totalTokens: Int

    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
//
//    public var hashValue: Int {
//        return 0
//    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
