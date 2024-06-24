$version: "2"

namespace com.cody.model

resource Bedrock {
    operations: [
        SendMessage
    ]
}

@http(method: "POST", uri: "/api/bedrock/message")
operation SendMessage with [StandardExceptions] {
    input := {
        @required
        messages: Messages

        @required
        model: Model
    }

    output := {
        @required
        messages: Messages
    }

    errors: [
        InputLimitExceededException
        UnexpectedMessageTypeError
    ]
}

enum Participant {
    HUMAN
    ASSISTANT
}

structure Message {
    participant: Participant
    images: Images
    documents: Documents
    text: String
}

list Messages {
    member: Message
}

enum Model {
    OPUS
    SONNET
    HAIKU
}
