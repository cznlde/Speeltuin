import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = []
    
    func sendMessage(message: String) async {
          let openBody = OpenAIBody(model: "gpt-3.5-turbo", messages: [
                   Message(role: "system", content: "You are talking to a dog."),
                   Message(role: "user", content: message)
          ], temperature: 0.2, max_tokens: 150)
        guard let url = URL(string: OpenAIConstants.baseUrl) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        
        // MARK: - headers
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(OpenAIConstants.openApiKey)", forHTTPHeaderField: "Authorization")
        
        // MARK: - body
        do {
            let body = try JSONEncoder().encode(openBody)
            request.httpBody = body
        } catch {
            print("Failed to encode body: \(error)")
            return
        }
        
        // MARK: - method
        request.httpMethod = "POST"
        
        // MARK: - network call
              do {
                  let (data, response) = try await URLSession.shared.data(for: request)
                  guard let response = response as? HTTPURLResponse else {
                      print("Invalid response received")
                      throw NetworkError.invalidResponse
                  }
                  print("Response status code: \(response.statusCode)")
                  guard response.statusCode == 200 else {
                      if let dataString = String(data: data, encoding: .utf8) {
                          print("Response data: \(dataString)")
                      }
                      print("Unexpected status code: \(response.statusCode)")
                      throw NetworkError.invalidResponse
                  }
                  
                  do {
                      let openAIResponse = try JSONDecoder().decode(OpenAIResponse.self, from: data)
                      print(openAIResponse)
                      // MARK: - chat
                      // let chat = Chat(message: message, response: openAIResponse.choices.first?.message.content ?? "")
                      // chats.append(chat)
                  } catch {
                      print("Failed to decode response: \(error)")
                      throw error
                  }
                  
              } catch {
                  print("Network error: \(error)")
              }
          }
      }
