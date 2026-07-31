//
//  CalendarView.swift
//  Memora
//
//  Created by Apprenant76 on 22/07/2026.
//

import SwiftUI

struct CalendarView: View {
    @State var date = Date()
    @State var isAddSheetPresented: Bool = false
    
    var calendar = Calendar.current
    
    @State var events: [Event]
    var selectedDayEvents: [Event] {
        events.filter({
            calendar.compare($0.date, to: date, toGranularity: .day) == .orderedSame
        })
    }
    
    
    var body: some View {
        VStack {
            DatePicker("", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .environment(\.locale, Locale.init(identifier: "fr"))
                .tint(.accent)
            ScrollView {
                ForEach(selectedDayEvents.enumerated(), id: \.offset) { index, event in
                    NavigationLink {
                        EventDetailView(event: $events[index], events: $events)
                    } label: {
                        EventListElementView(event: event)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Calendrier")
                        .font(.largeTitle)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddSheetPresented = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }
                }
            }
            .sheet(isPresented: $isAddSheetPresented) {
                AddEventSheetView(
                    events: $events,
                    isAddSheetPresented: $isAddSheetPresented
                )
            }
        }
        .padding(.horizontal, 12)
        .background(Color.background)
    }
}

#Preview {
    CalendarView(events: crisis)
}
