import Foundation

public class FileSystem {
    public class func availableDeviceSpace() -> NSNumber {
        if let dict = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) {
            if let freespace = dict[FileAttributeKey.systemFreeSize] as? NSNumber {
                return freespace
            }
        }
        return 0
    }

    public class func removeALLfilesInTempDirectory() {
        Queues.dispatchBackgroundQueueASync {
            if let tmpDirectory = try? FileManager.default.contentsOfDirectory(atPath: NSTemporaryDirectory()) {
                tmpDirectory.forEach { file in
                    let path = String(format: "%@%@", NSTemporaryDirectory(), file)
                    try? FileManager.default.removeItem(atPath: path)
                }
            }
        }
    }
}
