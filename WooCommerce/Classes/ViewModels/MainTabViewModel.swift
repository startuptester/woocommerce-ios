import Foundation
import Yosemite


// MARK: - MainTabViewModel Notifications
//
extension NSNotification.Name {

    /// Posted whenever an OrderBadge refresh is required.
    ///
    public static let ordersBadgeReloadRequired = Foundation.Notification.Name(rawValue: "com.woocommerce.ios.ordersBadgeReloadRequired")
}

final class MainTabViewModel {
    var onReload: ((String?) -> Void)?

    /// Bootstrap the data pipeline for the orders badge
    /// Fetches the initial badge count and observes notifications requesting a refresh
    /// The notification observed will be `ordersBadgeReloadRequired`
    ///
    func startObservingOrdersCount() {
        observeBadgeRefreshNotifications()
        requestBadgeCount()
    }
}


private extension MainTabViewModel {
    enum Constants {
        static let ninePlus = "9+"
    }

    @objc func requestBadgeCount() {
        guard let siteID = StoresManager.shared.sessionManager.defaultStoreID else {
            DDLogError("# Error: Cannot fetch order count")
            return
        }

        let action = OrderAction.countProcessingOrders(siteID: siteID) { [weak self] orderCount, error in
            if error != nil {
                return
            }

            self?.processBadgeCount(orderCount)
        }

        StoresManager.shared.dispatch(action)
    }

    func processBadgeCount(_ orderCount: OrderCount?) {
        /// Exit early if there is not data, or the count is zero
        guard let orderCount = orderCount,
            let processingCount = orderCount[OrderStatusEnum.processing.rawValue]?.total,
            processingCount > 0 else {
            onReload?(nil)
            return
        }

        let returnValue = readableCount(processingCount)

        onReload?(returnValue)
    }

    private func readableCount(_ count: Int) -> String {
        return count > 9 ? Constants.ninePlus : String(count)
    }

    private func observeBadgeRefreshNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(requestBadgeCount),
                                               name: .ordersBadgeReloadRequired,
                                               object: nil)
    }
}
