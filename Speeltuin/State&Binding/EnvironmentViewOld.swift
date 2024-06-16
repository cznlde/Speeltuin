//
//  EnvironmentViewOld.swift
//  Speeltuin
//
//  Created by Ivana Kolin on 16.06.24.
//

import SwiftUI

struct EnvironmentViewOld: View {
    @EnvironmentObject var modelOld: MyModelOld

    var body: some View {
        Toggle(isOn: $modelOld.isOn) {
            Image(systemName: modelOld.isOn ? "lightbulb.max" : "lightbulb")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(modelOld.isOn ? .yellow : .blue)
        }
        .fixedSize()
    }
}

#Preview {
    EnvironmentViewOld()
        .environmentObject(MyModelOld()) // pre iOS 17
}
