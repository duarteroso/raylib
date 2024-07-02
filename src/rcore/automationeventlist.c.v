module rcore

@[typedef]
struct C.AutomationEventList {
	capacity u32
	count    u32
	events   &CAutomationEvent
}

type CAutomationEventList = C.AutomationEventList
