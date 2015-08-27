import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    @IBOutlet var itLabel: WKInterfaceLabel!
    @IBOutlet var isLabel: WKInterfaceLabel!
    @IBOutlet var halfLabel: WKInterfaceLabel!
    @IBOutlet var tenMinutesLabel: WKInterfaceLabel!
    @IBOutlet var quarterLabel: WKInterfaceLabel!
    @IBOutlet var twentyLabel: WKInterfaceLabel!
    @IBOutlet var fiveMinutesLabel: WKInterfaceLabel!
    @IBOutlet var minutesLabel: WKInterfaceLabel!
    @IBOutlet var toLabel: WKInterfaceLabel!
    @IBOutlet var pastLabel: WKInterfaceLabel!
    @IBOutlet var oneLabel: WKInterfaceLabel!
    @IBOutlet var threeLabel: WKInterfaceLabel!
    @IBOutlet var twoLabel: WKInterfaceLabel!
    @IBOutlet var fourLabel: WKInterfaceLabel!
    @IBOutlet var fiveHourLabel: WKInterfaceLabel!
    @IBOutlet var sixLabel: WKInterfaceLabel!
    @IBOutlet var sevenLabel: WKInterfaceLabel!
    @IBOutlet var eightLabel: WKInterfaceLabel!
    @IBOutlet var nineLabel: WKInterfaceLabel!
    @IBOutlet var tenHourLabel: WKInterfaceLabel!
    @IBOutlet var elevenLabel: WKInterfaceLabel!
    @IBOutlet var twelveLabel: WKInterfaceLabel!
    @IBOutlet var oclockLabel: WKInterfaceLabel!

    let onColor = UIColor.whiteColor()
    let offColor = UIColor.darkGrayColor()

    var updateTimer: NSTimer?
    var labelProvider: LabelProvider?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        let labels = NaturalTimeLabels(
            itLabel: itLabel,
            isLabel: isLabel,
            halfLabel: halfLabel,
            tenMinutesLabel: tenMinutesLabel,
            quarterLabel: quarterLabel,
            twentyLabel: twentyLabel,
            fiveMinutesLabel: fiveMinutesLabel,
            minutesLabel: minutesLabel,
            toLabel: toLabel,
            pastLabel: pastLabel,
            oneLabel: oneLabel,
            threeLabel: threeLabel,
            twoLabel: twoLabel,
            fourLabel: fourLabel,
            fiveHourLabel: fiveHourLabel,
            sixLabel: sixLabel,
            sevenLabel: sevenLabel,
            eightLabel: eightLabel,
            nineLabel: nineLabel,
            tenHourLabel: tenHourLabel,
            elevenLabel: elevenLabel,
            twelveLabel: twelveLabel,
            oclockLabel: oclockLabel
        )

        labelProvider = LabelProvider(labels: labels, onColor: UIColor.whiteColor(), offColor: UIColor.darkGrayColor())
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        startUpdating()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()

        stopUpdating()
    }

    func startUpdating() {
        let now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: now)
        let fireDate = calendar.dateFromComponents(components)
        updateTimer = NSTimer(fireDate: fireDate!, interval: 60.0, target: self, selector: "showCurrentTime", userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(updateTimer!, forMode: NSDefaultRunLoopMode)
    }

    func stopUpdating() {
        updateTimer?.invalidate()
    }

    func showCurrentTime() {
        let flags: NSCalendarUnit = [.Hour, .Minute]
        let now = NSDate()
        let components = NSCalendar.autoupdatingCurrentCalendar().components(flags, fromDate: now)

        labelProvider?.showTime(hour: components.hour, minute: components.minute)
    }
}