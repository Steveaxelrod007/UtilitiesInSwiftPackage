import Foundation
import SafariServices
import UIKit

public func UISmemoryUsage() -> String {
    var taskInfo = task_vm_info_data_t()
    var count = mach_msg_type_number_t(MemoryLayout<task_vm_info>.size) / 4
    let result: kern_return_t = withUnsafeMutablePointer(to: &taskInfo) {
        $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
        }
    }

    var used: UInt64 = 0
    if result == KERN_SUCCESS {
        used = UInt64(taskInfo.phys_footprint)
    }

    let total = ProcessInfo.processInfo.physicalMemory

    let bytesInMegabyte = 1024.0 * 1024.0
    let usedMemory = Double(used) / bytesInMegabyte
    let totalMemory = Double(total) / bytesInMegabyte
    return String(format: "%.1f of %@MB used", usedMemory, Int(totalMemory).fullNotation())
}

public func UISloadURLdisplayInWeb(vc: UIViewController, url: String) {
    guard let url = URL(string: url) else { return }

    let safari = SFSafariViewController(url: url)
    safari.preferredBarTintColor = UIColor.black
    vc.present(safari, animated: true, completion: nil)
}

public func UISvibrate() {
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    generator.impactOccurred()
}

public func UISDebugPrint(_ msg: String) {
    print("\(Date().timeIntervalSince1970) -> \(msg)")
}

public func UISPostNote(name: NSNotification.Name) {
    NotificationCenter.default.post(name: name, object: nil)
}

public func UISDEINIT(val: AnyObject) {
    UISDebugPrint("****** deinit \(String(describing: type(of: val)))")
}

public func UISgenerateSecureCode(size: Int, onlyLetters: Bool = false) -> String {
    let lower = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    let upper = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let symbols = ["!", "@", "#", "$", "%", "^", "*", "-", "+", "="]

    var str = "\(Int.random(in: 0 ... Int.max))\(Int.random(in: 0 ... Int.max))\(Date().timeIntervalSince1970)\(Int.random(in: 0 ... Int.max))\(ProcessInfo.processInfo.globallyUniqueString)\(Int.random(in: 0 ... Int.max))".uppercased()
    str = str.replacingOccurrences(of: "-", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "0", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: ".", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "A", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "B", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "C", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "D", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "E", with: "\(Int.random(in: 0 ... Int.max))")
    str = str.replacingOccurrences(of: "F", with: "\(Int.random(in: 0 ... Int.max))")

    for _ in 1 ... 1000 {
        let letter = Character(lower[Int.random(in: 0 ..< lower.count)])
        let insertIndex = Int.random(in: 0 ..< str.count)
        str.insert(letter, at: str.index(str.startIndex, offsetBy: insertIndex))

        if onlyLetters == false {
            let symbol = Character(symbols[Int.random(in: 0 ..< symbols.count)])
            let insertIndex2 = Int.random(in: 0 ..< str.count)
            str.insert(symbol, at: str.index(str.startIndex, offsetBy: insertIndex2))
        }

        let letter1 = Character(upper[Int.random(in: 0 ..< upper.count)])
        let insertIndex1 = Int.random(in: 0 ..< str.count)
        str.insert(letter1, at: str.index(str.startIndex, offsetBy: insertIndex1))
    }

    return String(str.prefix(size))
}
