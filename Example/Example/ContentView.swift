//
//  ContentView.swift
//  Example
//
//  Created by Naruki Chigira on 2021/07/23.
//

import SwiftUI
import CallStackSymbols

struct ContentView: View {
    @State var message: String = ""

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Text(message)
                .font(.body)
        }
        .padding()
        .onAppear {
            showCallStackSymbols()
        }
    }

    private func showCallStackSymbols() {
        do {
            let message = try CallStackSymbols.current().map { $0.callStackSymbolRepresentation }.joined(separator: "\n")
            self.message = message
        } catch {
            self.message = "Got Error:\n\(error)"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
