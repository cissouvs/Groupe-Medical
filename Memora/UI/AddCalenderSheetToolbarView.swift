ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isAddSheetPresented = false
                        eventTitle = ""
                        eventDescription = ""
                        isEventAllDay = false
                        eventDate = Date()
                        eventEndTime = Date()
                        eventType = .other
                        eventLocation = ""
                        eventParticipants = []
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Nouveau")
                        .font(.title2)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        events
                            .append(
                                Event(
                                    title: eventTitle,
                                    date: eventDate,
                                    isAllDay: isEventAllDay,
                                    endTime: isEventAllDay ? nil : eventEndTime,
                                    description: eventDescription,
                                    type: eventType,
                                    participants: []
                                )
                            )
                        isAddSheetPresented = false
                    } label: {
                        Image(systemName: "checkmark")
                    }
                    .tint(.accent)
                    .buttonStyle(.glassProminent)
                    .disabled(eventTitle.isEmpty)
                }