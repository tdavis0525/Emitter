import Foundation

// Protocol status values
enum ProtocolStatus: Int {
    case unknown = 0
    case connecting = 1
    case connected = 2
    case disconnected = 3
    case error = 4
}

// Error types
enum ObserverError: Error {
    case invalidAction
    case invalidState
    case networkError(Error)
    case timeoutError
    case connectionLostError
    // Add other error types as needed
}