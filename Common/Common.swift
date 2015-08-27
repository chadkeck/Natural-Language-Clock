import Foundation
import UIKit

protocol ToggleableLabel {
    func turnOn()
    func turnOff()
}

struct NaturalTimeLabels {
    var itLabel: ToggleableLabel
    var isLabel: ToggleableLabel
    var halfLabel: ToggleableLabel
    var tenMinutesLabel: ToggleableLabel
    var quarterLabel: ToggleableLabel
    var twentyLabel: ToggleableLabel
    var fiveMinutesLabel: ToggleableLabel
    var minutesLabel: ToggleableLabel
    var toLabel: ToggleableLabel
    var pastLabel: ToggleableLabel
    var oneLabel: ToggleableLabel
    var threeLabel: ToggleableLabel
    var twoLabel: ToggleableLabel
    var fourLabel: ToggleableLabel
    var fiveHourLabel: ToggleableLabel
    var sixLabel: ToggleableLabel
    var sevenLabel: ToggleableLabel
    var eightLabel: ToggleableLabel
    var nineLabel: ToggleableLabel
    var tenHourLabel: ToggleableLabel
    var elevenLabel: ToggleableLabel
    var twelveLabel: ToggleableLabel
    var oclockLabel: ToggleableLabel
}

protocol NaturalTimeLabelProvider {
    var itLabel: ToggleableLabel { get }
    var isLabel: ToggleableLabel { get }
    var halfLabel: ToggleableLabel { get }
    var tenMinutesLabel: ToggleableLabel { get }
    var quarterLabel: ToggleableLabel { get }
    var twentyLabel: ToggleableLabel { get }
    var fiveMinutesLabel: ToggleableLabel { get }
    var minutesLabel: ToggleableLabel { get }
    var toLabel: ToggleableLabel { get }
    var pastLabel: ToggleableLabel { get }
    var oneLabel: ToggleableLabel { get }
    var threeLabel: ToggleableLabel { get }
    var twoLabel: ToggleableLabel { get }
    var fourLabel: ToggleableLabel { get }
    var fiveHourLabel: ToggleableLabel { get }
    var sixLabel: ToggleableLabel { get }
    var sevenLabel: ToggleableLabel { get }
    var eightLabel: ToggleableLabel { get }
    var nineLabel: ToggleableLabel { get }
    var tenHourLabel: ToggleableLabel { get }
    var elevenLabel: ToggleableLabel { get }
    var twelveLabel: ToggleableLabel { get }
    var oclockLabel: ToggleableLabel { get }
}

class LabelProvider: NaturalTimeLabelProvider {
    let labels: NaturalTimeLabels
    var onColor: UIColor
    var offColor: UIColor
    init(labels: NaturalTimeLabels, onColor: UIColor, offColor: UIColor) {
        self.labels = labels
        self.onColor = onColor
        self.offColor = offColor
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
    var itLabel: ToggleableLabel { return labels.itLabel }
    var isLabel: ToggleableLabel { return labels.isLabel }
    var halfLabel: ToggleableLabel { return labels.halfLabel }
    var tenMinutesLabel: ToggleableLabel { return labels.tenMinutesLabel }
    var quarterLabel: ToggleableLabel { return labels.quarterLabel }
    var twentyLabel: ToggleableLabel { return labels.twentyLabel }
    var fiveMinutesLabel: ToggleableLabel { return labels.fiveMinutesLabel }
    var minutesLabel: ToggleableLabel { return labels.minutesLabel }
    var toLabel: ToggleableLabel { return labels.toLabel }
    var pastLabel: ToggleableLabel { return labels.pastLabel }
    var oneLabel: ToggleableLabel { return labels.oneLabel }
    var threeLabel: ToggleableLabel { return labels.threeLabel }
    var twoLabel: ToggleableLabel { return labels.twoLabel }
    var fourLabel: ToggleableLabel { return labels.fourLabel }
    var fiveHourLabel: ToggleableLabel { return labels.fiveHourLabel }
    var sixLabel: ToggleableLabel { return labels.sixLabel }
    var sevenLabel: ToggleableLabel { return labels.sevenLabel }
    var eightLabel: ToggleableLabel { return labels.eightLabel }
    var nineLabel: ToggleableLabel { return labels.nineLabel }
    var tenHourLabel: ToggleableLabel { return labels.tenHourLabel }
    var elevenLabel: ToggleableLabel { return labels.elevenLabel }
    var twelveLabel: ToggleableLabel { return labels.twelveLabel }
    var oclockLabel: ToggleableLabel { return labels.oclockLabel }

    var hourLabels = [ToggleableLabel]()
    var minuteLabels = [ToggleableLabel]()

    func showTime(hour hour: Int, minute: Int) {
        itLabel.turnOn()
        isLabel.turnOn()

        setHour(hour)
        setMinute(minute)
    }

    func setHour(hour: Int) {
        hourLabels.forEach { $0.turnOff() }

        switch hour {
        case 1:
            oneLabel.turnOn()
        case 2:
            twoLabel.turnOn()
        case 3:
            threeLabel.turnOn()
        case 4:
            fourLabel.turnOn()
        case 5:
            fiveHourLabel.turnOn()
        case 6:
            sixLabel.turnOn()
        case 7:
            sevenLabel.turnOn()
        case 8:
            eightLabel.turnOn()
        case 9:
            nineLabel.turnOn()
        case 10:
            tenHourLabel.turnOn()
        case 11:
            elevenLabel.turnOn()
        case 12:
            twelveLabel.turnOn()
        default: // handle 24-hour locales
            setHour(hour % 12)
        }
    }

    func setMinute(minute: Int) {
        minuteLabels.forEach { $0.turnOff() }

        switch minute {
        case 5..<10:
            fiveMinutesLabel.turnOn()
            minutesLabel.turnOn()
        case 10..<15:
            tenMinutesLabel.turnOn()
            minutesLabel.turnOn()
        case 15..<20:
            quarterLabel.turnOn()
        case 20..<25:
            twentyLabel.turnOn()
            minutesLabel.turnOn()
        case 25..<30:
            twentyLabel.turnOn()
            fiveMinutesLabel.turnOn()
            minutesLabel.turnOn()
        case 30..<35:
            halfLabel.turnOn()
        case 35..<40:
            twentyLabel.turnOn()
            fiveMinutesLabel.turnOn()
            minutesLabel.turnOn()
        case 40..<45:
            twentyLabel.turnOn()
            minutesLabel.turnOn()
        case 45..<50:
            quarterLabel.turnOn()
        case 50..<55:
            tenMinutesLabel.turnOn()
            minutesLabel.turnOn()
        case 55..<60:
            fiveMinutesLabel.turnOn()
            minutesLabel.turnOn()

        default:
            oclockLabel.turnOn()
        }

        switch minute {
        case 5..<35:
            pastLabel.turnOn()
        case 35..<60:
            toLabel.turnOn()
        default: break
        }
    }
}