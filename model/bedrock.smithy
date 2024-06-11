$version: "2"

namespace com.cody.model

resource Bedrock {
    operations: [
        SendText
        SendImage
        SendDocument
    ]
}

@mixin
@suppress(["MissingPaginatedTrait", "StandardOperationVerb"])
operation BedrockExceptions {
    errors: [
        InputLimitExceededException
        UnexpectedMessageTypeError
    ]
}

@http(method: "POST", uri: "/api/bedrock/text")
operation SendText with [StandardExceptions, BedrockExceptions] {
    input := {
        @required
        @httpPayload
        message: String
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/bedrock/image")
operation SendImage with [StandardExceptions, BedrockExceptions] {
    input := {
        @required
        @httpPayload
        image: Blob
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/bedrock/document")
operation SendDocument with [StandardExceptions, BedrockExceptions] {
    input := {
        @required
        @httpPayload
        document: Blob
    }

    output := {
        @required
        message: String
    }
}
