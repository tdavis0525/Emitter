stateDiagram-v2
    [*] --> Connecting
    Connecting --> Connected: ConnectionEstablished
    Connecting --> Error: ConnectionFailed
    Connected --> Sending: SendMessage(message, type)
    Sending --> WaitingForAck: type == Critical
    Sending --> Connected: type != Critical
    WaitingForAck --> Connected: ReceiveAck(sequenceNumber)
    WaitingForAck --> Retransmitting: Timeout
    Retransmitting --> WaitingForAck: ResendMessage
    Retransmitting --> Error: RetransmissionFailed
    WaitingForAck --> Error: PacketLoss
    Connected --> Receiving: ReceiveMessage(message, source)
    Receiving --> Connected: ProcessMessage
    Receiving --> Error: InvalidMessage
    Connected --> Disconnecting: Disconnect
    Disconnecting --> Idle: Disconnected
    Disconnecting --> Error: DisconnectFailed
    Error --> Disconnecting: AttemptReconnect
    Error --> Idle: ErrorResolved
    Idle --> Connecting: Connect
    Connected --> Connected: RTTUpdate
    Connected --> Connected: ReportNetworkConditions
    Connected --> Connected: AdjustCongestionWindow
    Connected --> Connected: AdjustTransmissionRate