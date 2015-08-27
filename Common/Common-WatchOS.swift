import WatchKit

extension WKInterfaceLabel: ToggleableLabel {
    func turnOn() {
        setTextColor(UIColor.whiteColor())
    }

    func turnOff() {
        setTextColor(UIColor.darkGrayColor())
    }
}
