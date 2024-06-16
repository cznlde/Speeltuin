//
//  Environment.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 16.06.24.
//
/// ObservableObject:
/// `ObservableObject` is a protocol in SwiftUI that allows an object to be observed for changes.
/// Classes conforming to `ObservableObject` can have properties marked with the `@Published` attribute, which notifies any observing views when these properties change.
///
/// Purpose:
/// The primary purpose of `ObservableObject` is to enable the separation of data (state) and the UI. By using `ObservableObject`, you can create data models that can be observed by SwiftUI views, ensuring that the UI updates automatically when the underlying data changes.
///
/// Usage:
/// 1. Define a class that conforms to the `ObservableObject` protocol.
/// 2. Use the `@Published` property wrapper to mark properties that should trigger view updates when they change.
/// 3. In your SwiftUI view, use `@ObservedObject`, `@StateObject`, or `@EnvironmentObject` to create an instance of your observable object or to inject it into the view hierarchy.
///
/// Example:
/// ```swift
/// class MyModel: ObservableObject {
///     @Published var name: String = "World"
/// }
///
/// struct ContentView: View {
///     @ObservedObject var model = MyModel()
///
///     var body: some View {
///         Text("Hello, \(model.name)!")
///     }
/// }
///
///#Preview {
///    ContentView()
///        .environmentObject(AppState())
///}
/// ```
/// In this example, any changes to `model.name` will automatically update the `Text` view in `ContentView`.

import Foundation
import SwiftUI
import Observation

// iOS 17 and newer
@Observable
class MyModel {
    var isOn: Bool = false
}
 
// pre iOS 17
class MyModelOld: ObservableObject {
   @Published var isOn: Bool = false
}

