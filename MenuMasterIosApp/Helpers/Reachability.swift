//
//  Reachability.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation
import Network
import SystemConfiguration

open class Reachability {
    
//    class func isConnectedToNetwork() -> Bool
//    {
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//        
//        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
//                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
//            }
//        }
//        
//        var flags = SCNetworkReachabilityFlags()
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
//            return false
//        }
//        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
//        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
//        return (isReachable && !needsConnection)
//    }
    static let shared = Reachability()
        private var monitor: NWPathMonitor
        private var queue = DispatchQueue.global(qos: .background)
        
        private init() {
            monitor = NWPathMonitor()
            monitor.start(queue: queue)
        }
        
        func isConnectedToNetwork(completion: @escaping (Bool) -> Void) {
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
        
        func stopMonitoring() {
            monitor.cancel()
        }
    }
