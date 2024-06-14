//
//  Reachability.swift
//  MenuMasterIosApp
//
//  Created by Cansu Özdizlekli on 6/6/24.
//

import Foundation
import Network

open class Reachability {
    
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
