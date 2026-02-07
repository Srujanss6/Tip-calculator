//
//  ContentView.swift
//  Day17
//
//  Created by Srujan S S on 06/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 5
    let tip = [10, 20, 50, 89]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea()
                Form{
                    Section{
                        TextField("enter value",
                                  value: $checkAmount,
                                  format:
                                .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    
                    Picker("pick one", selection: $numberOfPeople) {
                        ForEach(0..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Section("how much you wanna tip") {
                        Picker("tip percentage", selection: $tipPercentage) {
                            ForEach(tip, id:\.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section {
                        let total = checkAmount * Double(numberOfPeople) * (Double(tipPercentage) / 100)
                        Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Tip calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
