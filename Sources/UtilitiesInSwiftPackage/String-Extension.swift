import Foundation

extension String {
    func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func justNumbers() -> String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
