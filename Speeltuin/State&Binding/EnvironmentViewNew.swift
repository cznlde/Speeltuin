//
//  EnvironmentViewNew.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 16.06.24.
//

import SwiftUI

struct EnvironmentViewNew: View {
    @Environment(MyModel.self) private var model: MyModel
    // to avoid error: Cannot find '$model' in scope
    // use @Bindable var model = MyModel() to inject the model into the environment

    var body: some View {
        @Bindable var model = model

        Toggle(isOn: $model.isOn) {
            Image(systemName: model.isOn ? "moon.stars.fill" : "sun.max.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(model.isOn ? .yellow : .orange)
        }
        .fixedSize()
    }
}

#Preview {
    EnvironmentViewNew()
        .environment(MyModel()) // iOS 17 and newer
}
