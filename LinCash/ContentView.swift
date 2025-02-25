//
//  ContentView.swift
//  LinCash
//
//  Created by Arn0 A on 2025/2/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            BillListView()
                .tabItem {
                    Label("Bills", systemImage: "list.bullet")
                }
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Button(action: startVoiceRecognition) {
                Label("Voice Record", systemImage: "mic")
            }
            Button(action: startOCR) {
                Label("Import Screenshot", systemImage: "photo")
            }
        }
    }
    
    func startVoiceRecognition() {
        // Start voice recognition
    }
    
    func startOCR() {
        // Start OCR process
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
