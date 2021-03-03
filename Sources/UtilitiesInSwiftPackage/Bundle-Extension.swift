import AVFoundation
import Foundation
import UIKit

extension Bundle {
    var version: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }

    var build: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }

    var appStoreAppId: String? {
        return infoDictionary?["AppStoreAppId"] as? String
    }

    var versionInfoString: String {
        return "\(Bundle.main.version ?? "") (\(Bundle.main.build ?? ""))"
    }

    var versionInfoStringURLEncoded: String {
        return versionInfoString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
