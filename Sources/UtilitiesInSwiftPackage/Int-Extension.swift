// axee.com by Steve Axelrod

import Foundation

extension Int {
    public func fullNotation() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale.current
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true

        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    public func distance() -> (num: String, designator: String) {
        let feet = Double(self) * Double(3.28084)

        let str1: String
        var str2 = "mi"
        if feet < 1000 {
            str1 = "\(Int(feet))"
            str2 = "ft"
        } else
        if feet < (10 * 5280) {
            str1 = "\(String(format: "%.2f", Float(feet / 5280.0)))"
        } else {
            let miles = feet / 5280.0
            if miles <= 999 {
                str1 = "\(String(format: "%.1f", Float(miles)))"
            } else {
                str1 = "\(Int(miles).fullNotation())"
            }
        }

        return (str1, str2)
    }
}
