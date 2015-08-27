import UIKit

class ViewController: UIViewController {
    @IBOutlet var itLabel: UILabel!
    @IBOutlet var isLabel: UILabel!
    @IBOutlet var halfLabel: UILabel!
    @IBOutlet var tenMinutesLabel: UILabel!
    @IBOutlet var quarterLabel: UILabel!
    @IBOutlet var twentyLabel: UILabel!
    @IBOutlet var fiveMinutesLabel: UILabel!
    @IBOutlet var minutesLabel: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var pastLabel: UILabel!
    @IBOutlet var oneLabel: UILabel!
    @IBOutlet var threeLabel: UILabel!
    @IBOutlet var twoLabel: UILabel!
    @IBOutlet var fourLabel: UILabel!
    @IBOutlet var fiveHourLabel: UILabel!
    @IBOutlet var sixLabel: UILabel!
    @IBOutlet var sevenLabel: UILabel!
    @IBOutlet var eightLabel: UILabel!
    @IBOutlet var nineLabel: UILabel!
    @IBOutlet var tenHourLabel: UILabel!
    @IBOutlet var elevenLabel: UILabel!
    @IBOutlet var twelveLabel: UILabel!
    @IBOutlet var oclockLabel: UILabel!

    let onColor = UIColor.whiteColor()
    let offColor = UIColor.darkGrayColor()

    var updateTimer: NSTimer?
    var labelProvider: LabelProvider?

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        startUpdating()
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

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
