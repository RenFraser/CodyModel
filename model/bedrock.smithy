$version: "2"

namespace com.cody.model

resource Bedrock {
    operations: [
        SendText
        SendImage
        SendDocument
    ]
}

@http(method: "POST", uri: "/api/bedrock/text")
operation SendText {
    input: SendTextInput
    output: SendTextOutput
    errors: [
        InputLimitExceededException
        UnexpectedMessageTypeError
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure SendTextInput {
    @required
    @httpPayload
    message: String
}

@output
structure SendTextOutput {
    @required
    message: String
}

@http(method: "POST", uri: "/api/bedrock/image")
operation SendImage {
    input: SendImageInput
    output: SendImageOutput
    errors: [
        InputLimitExceededException
        UnexpectedMessageTypeError
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure SendImageInput {
    @required
    @httpPayload
    image: Blob
}

@output
structure SendImageOutput {
    @required
    message: String
}

@http(method: "POST", uri: "/api/bedrock/document")
operation SendDocument {
    input: SendDocumentInput
    output: SendDocumentOutput
    errors: [
        InputLimitExceededException
        UnexpectedMessageTypeError
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure SendDocumentInput {
    @required
    @httpPayload
    document: Blob
}

@output
structure SendDocumentOutput {
    @required
    message: String
}
