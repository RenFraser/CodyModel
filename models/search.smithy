namespace com.cody.model


resource Search {
    operations: [ SearchFiles ]
}

@http(method: "POST", uri: "/api/search")
operation SearchFiles {
    input: SearchFilesInput,
    output: SearchFilesOutput
}

structure SearchFilesInput {
    @required
    @httpPayload
    query: String
}

structure SearchFilesOutput {
    @required
    results: PathsList
}