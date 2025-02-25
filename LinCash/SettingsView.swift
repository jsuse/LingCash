import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                // Account Management
                Section(header: Text("Account Management")) {
                    NavigationLink(destination: AccountManagementView()) {
                        Text("Manage Accounts")
                    }
                }
                
                // Budget Settings
                Section(header: Text("Budget Settings")) {
                    NavigationLink(destination: BudgetSettingsView()) {
                        Text("Set Budgets")
                    }
                }
                
                // Notification Settings
                Section(header: Text("Notification Settings")) {
                    Toggle("Transaction Notifications", isOn: .constant(true))
                    NavigationLink(destination: NotificationFrequencyView()) {
                        Text("Budget Reminder Frequency")
                    }
                }
                
                // Data Sync
                Section(header: Text("Data Sync")) {
                    Toggle("Cloud Sync", isOn: .constant(true))
                    NavigationLink(destination: BackupSettingsView()) {
                        Text("Backup Settings")
                    }
                }
                
                // Language and Region
                Section(header: Text("Language and Region")) {
                    NavigationLink(destination: LanguageSettingsView()) {
                        Text("Language")
                    }
                    NavigationLink(destination: CurrencySettingsView()) {
                        Text("Currency")
                    }
                }
                
                // Privacy and Security
                Section(header: Text("Privacy and Security")) {
                    Toggle("Password Protection", isOn: .constant(false))
                    Toggle("Biometric Authentication", isOn: .constant(false))
                }
                
                // App Theme
                Section(header: Text("App Theme")) {
                    NavigationLink(destination: ThemeSettingsView()) {
                        Text("Choose Theme")
                    }
                    NavigationLink(destination: FontSizeSettingsView()) {
                        Text("Adjust Font Size")
                    }
                }
                
                // Help and Feedback
                Section(header: Text("Help and Feedback")) {
                    NavigationLink(destination: HelpDocumentationView()) {
                        Text("Help Documentation")
                    }
                    NavigationLink(destination: FeedbackView()) {
                        Text("Submit Feedback")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

// Placeholder views for navigation links
struct AccountManagementView: View { var body: some View { Text("Account Management") } }
struct BudgetSettingsView: View { var body: some View { Text("Budget Settings") } }
struct NotificationFrequencyView: View { var body: some View { Text("Notification Frequency") } }
struct BackupSettingsView: View { var body: some View { Text("Backup Settings") } }
struct LanguageSettingsView: View { var body: some View { Text("Language Settings") } }
struct CurrencySettingsView: View { var body: some View { Text("Currency Settings") } }
struct ThemeSettingsView: View { var body: some View { Text("Theme Settings") } }
struct FontSizeSettingsView: View { var body: some View { Text("Font Size Settings") } }
struct HelpDocumentationView: View { var body: some View { Text("Help Documentation") } }
struct FeedbackView: View { var body: some View { Text("Feedback") } }

#Preview {
    SettingsView()
} 