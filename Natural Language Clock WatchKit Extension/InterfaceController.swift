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
    var minuteLabels = [WKInterfaceLabel]()
    var hourLabels = [WKInterfaceLabel]()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        hourLabels = [
            oneLabel,
            twoLabel,
            threeLabel,
            fourLabel,
            fiveHourLabel,
            sixLabel,
            sevenLabel,
            eightLabel,
            nineLabel,
            tenHourLabel,
            elevenLabel,
            twelveLabel
        ]

        minuteLabels = [
            halfLabel,
            tenMinutesLabel,
            quarterLabel,
            twentyLabel,
            fiveMinutesLabel,
            minutesLabel,
            toLabel,
            pastLabel,
            oclockLabel
        ]
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

        itLabel.setTextColor(onColor)
        isLabel.setTextColor(onColor)

        setHourAndMinute(hour: components.hour, minute: components.minute)
    }

    func setHourAndMinute(hour hour: Int, minute: Int) {
        hourLabels.map { $0.setTextColor(offColor) }
        minuteLabels.map { $0.setTextColor(offColor) }

        switch minute {
        case 5..<10:
            fiveMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 10..<15:
            tenMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 15..<20:
            quarterLabel.setTextColor(onColor)
        case 20..<25:
            twentyLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 25..<30:
            twentyLabel.setTextColor(onColor)
            fiveMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 30..<35:
            halfLabel.setTextColor(onColor)
        case 35..<40:
            twentyLabel.setTextColor(onColor)
            fiveMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 40..<45:
            twentyLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 45..<50:
            quarterLabel.setTextColor(onColor)
        case 50..<55:
            tenMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)
        case 55..<60:
            fiveMinutesLabel.setTextColor(onColor)
            minutesLabel.setTextColor(onColor)

        default:
            oclockLabel.setTextColor(onColor)
        }

        switch minute {
        case 5..<35:
            pastLabel.setTextColor(onColor)
        case 35..<60:
            toLabel.setTextColor(onColor)
        default: break
        }

        let hourToIlluminate = minute >= 35 ? hour + 1 : hour
        switch hourToIlluminate {
        case 1:
            oneLabel.setTextColor(onColor)
        case 2:
            twoLabel.setTextColor(onColor)
        case 3:
            threeLabel.setTextColor(onColor)
        case 4:
            fourLabel.setTextColor(onColor)
        case 5:
            fiveHourLabel.setTextColor(onColor)
        case 6:
            sixLabel.setTextColor(onColor)
        case 7:
            sevenLabel.setTextColor(onColor)
        case 8:
            eightLabel.setTextColor(onColor)
        case 9:
            nineLabel.setTextColor(onColor)
        case 10:
            tenHourLabel.setTextColor(onColor)
        case 11:
            elevenLabel.setTextColor(onColor)
        case 12:
            twelveLabel.setTextColor(onColor)
        default: // handle 24-hour locales
            setHourAndMinute(hour: (hour % 12), minute: minute)
        }


    }
}