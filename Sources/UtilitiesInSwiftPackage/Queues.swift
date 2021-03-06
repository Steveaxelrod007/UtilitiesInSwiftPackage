import Foundation

// axe, I mainly created these so as Swift morphs, I can easily adjust the function bodies and not all over the code base

public class Queues {
    public class func dispatchBackgroundQueueASyncConcurrent(closure: @escaping () -> Void) {
        DispatchQueue(label: "com.axee.concurrentQ", attributes: .concurrent).async {
            closure()
        }
    }

    public class func dispatchMainQueueAsync(closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }

    public class func dispatchMainQueueSync(closure: @escaping () -> Void) {
        DispatchQueue.main.sync {
            closure()
        }
    }

    public class func dispatchBackgroundQueueSync(closure: @escaping () -> Void) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).sync {
            closure()
        }
    }

    public class func dispatchBackgroundQueueASync(closure: @escaping () -> Void) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            closure()
        }
    }

    public class func delayThenRunMainQueue(delay: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            closure()
        }
    }
}
