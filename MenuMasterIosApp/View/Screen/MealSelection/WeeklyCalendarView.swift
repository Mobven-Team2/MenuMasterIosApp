import SwiftUI

struct WeeklyCalendarView: View {
    @State var monthString: String = Calendar.current.monthSymbols.count.description
    @State private var selectedDate: Date = Date()

    var body: some View {
        let dates = getWeek()
        return VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(dates, id: \.self) { day in
                        DayView(day: day, isSelected: getCurrentDay() == getDayNumber(date: day), selectedDate: $selectedDate)
                    }
                }.frame(height:90)
            }
        }
    }
    
    func getMonth(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }

    func getDayNumber(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        return components.day ?? 0
    }

    func getWeek() -> [Date] {
        let currentDate = Date()
        let calendar = Calendar.current
        let dayOfWeek = calendar.component(.weekday, from: currentDate)
        let daysInWeek = 7
        let startOfWeek = calendar.date(byAdding: .day, value: -dayOfWeek + 2, to: currentDate)!
        return (0..<daysInWeek).map { calendar.date(byAdding: .day, value: $0, to: startOfWeek)! }
    }
    
    func getCurrentDay() -> Int {
        let calendar = Calendar.current
        let components = calendar.component(.day, from: selectedDate)
        return components
    }
}

struct DayView: View {
    var day: Date
    var isSelected: Bool
    @Binding var selectedDate: Date

    var body: some View {
        Button(action: {
            withAnimation {
                selectedDate = day
            }
        }) {
            VStack {
                Text(getShortDayName(date: day))
                    .font(.poppins(size: 12))
                    .padding(.bottom,7)
                
                Text("\(getDayNumber(date: day))")
                    .font(.poppins(size: 16))
                
            }
        }
        .frame(width: 60, height: 80)
        .background(isSelected ? Color.theme.primaryGreenColor : .white)
        .foregroundColor(isSelected ? .white : Color.theme.customDarkTextColor)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
        .disabled(true)
    }
    
    func getShortDayName(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "tr_TR")
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from: date)
    }

    func getDayNumber(date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        return components.day ?? 0
    }
}

struct WeeklyCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCalendarView()
    }
}
