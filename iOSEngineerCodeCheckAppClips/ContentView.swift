//
//  ContentView.swift
//  iOSEngineerCodeCheckAppClips
//
//  Created by 村石拓海 on 2022/10/01.
//  Copyright © 2022 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
