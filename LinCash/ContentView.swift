//
//  ContentView.swift
//  LinCash
//
//  Created by Arn0 A on 2025/2/24.
//

import SwiftUI
import SwiftData
import SwiftUICharts

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
    @State private var isVoiceRecording = false
    @State private var totalValue: Double = 72
    @State private var categoryData: [Double] = [25, 30, 17]

    var body: some View {
        VStack {
            // Circular Chart
            PieChartView(data: categoryData, title: "Total Value", legend: "Categories", valueSpecifier: "%.0f")
                .frame(height: 200)
                .padding()

            // Category Sections
            HStack {
                VStack {
                    Circle().fill(Color.pink).frame(width: 20, height: 20)
                    Text("情感往来")
                }
                VStack {
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                    Text("三餐")
                }
                VStack {
                    Circle().fill(Color.yellow).frame(width: 20, height: 20)
                    Text("零食")
                }
            }
            .padding()

            // Start Recording Button
            Button(action: startRecording) {
                Text("立即记账")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()

            // Voice Recording Toggle
            Toggle(isOn: $isVoiceRecording) {
                Text("切换到语音记账")
            }
            .padding()
        }
        .onAppear {
            fetchData()
        }
    }

    func startRecording() {
        // Logic to start recording
    }

    func fetchData() {
        // Fetch data from backend and update totalValue and categoryData
        // Example: Use URLSession to call the API and update state variables
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
