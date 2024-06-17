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

        participant: Participant
    }

    output := {
        @required
        messages: Messages

        participant: Participant
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
