import SwiftUI
import SwiftUICharts // Ensure this library is added to your project

struct BillListView: View {
    @State private var currentMonth: Date = Date()
    @State private var dailyBalances: [String: Double] = [:]
    @State private var monthlyData: [(month: String, income: Double, expenditure: Double)] = []

    var body: some View {
        VStack {
            // Month Navigation
            HStack {
                Button(action: { changeMonth(by: -1) }) {
                    Text("<")
                }
                Text(currentMonth, style: .date)
                    .font(.largeTitle)
                Button(action: { changeMonth(by: 1) }) {
                    Text(">")
                }
            }
            .padding()

            // Calendar View
            CalendarView(dailyBalances: dailyBalances)
                .padding()

            // Bar Chart
            BarChartView(data: ChartData(values: monthlyData.map { ($0.month, $0.income) }),
                         title: "Income & Expenditure",
                         legend: "Last 4 Months",
                         style: ChartStyle(backgroundColor: .white, accentColor: .green, secondGradientColor: .red, textColor: .black, legendTextColor: .gray, dropShadowColor: .gray))
                .padding()
        }
        .onAppear {
            fetchDailyBalances()
            fetchMonthlyData()
        }
    }

    func changeMonth(by offset: Int) {
        if let newMonth = Calendar.current.date(byAdding: .month, value: offset, to: currentMonth) {
            currentMonth = newMonth
            fetchDailyBalances()
        }
    }

    func fetchDailyBalances() {
        // Fetch daily balances from backend
    }

    func fetchMonthlyData() {
        // Fetch income and expenditure data for the last four months
    }
}

struct CalendarView: View {
    let dailyBalances: [String: Double]

    var body: some View {
        VStack {
            ForEach(dailyBalances.keys.sorted(), id: \.self) { date in
                HStack {
                    Text(date)
                    Spacer()
                    Text("\(dailyBalances[date] ?? 0, specifier: "%.2f")")
                        .foregroundColor((dailyBalances[date] ?? 0) < 0 ? .red : .green)
                }
                .padding()
            }
        }
    }
}

struct Transaction: Identifiable {
    let id = UUID()
    let description: String
    let amount: Double
} 