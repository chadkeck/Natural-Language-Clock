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

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
