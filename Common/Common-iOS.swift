import UIKit

extension UILabel: ToggleableLabel {
    func turnOn() {
        textColor = UIColor.whiteColor()
    }

    func turnOff() {
        textColor = UIColor.darkGrayColor()
    }
}