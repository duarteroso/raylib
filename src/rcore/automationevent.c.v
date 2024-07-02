module rcore

@[typedef]
struct C.AutomationEvent {
	frame u32
	// type u32
	params [4]int
}

type CAutomationEvent = C.AutomationEvent
