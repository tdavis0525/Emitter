stateDiagram-v2
    [*] --> Connecting
    Connecting --> Connected: ConnectionEstablished
    Connecting --> Error: ConnectionFailed
    Connected --> Sending: SendMessage(message)
    Sending --> Connected
    Connected --> Receiving: ReceiveMessage(message, source)
    Receiving --> Connected: ProcessMessage
    Receiving --> Error: InvalidMessage
    Connected --> Disconnecting: Disconnect
    Disconnecting --> Idle: Disconnected
    Disconnecting --> Error: DisconnectFailed
    Connected --> Paused: Pause
    Paused --> Connected: Resume
    Error --> Disconnecting: AttemptReconnect
    Error --> Idle: ErrorResolved
    Idle --> Connecting: Connect
    Connected --> Connected: RTTUpdate
    Connected --> Connected: ReportNetworkConditions
    Connected --> Connected: AdjustCongestionWindow
    Connected --> Connected: AdjustTransmissionRate