$version: "2"

namespace com.cody.model

resource Search {
    operations: [
        SearchFileNames
        SearchFileContent
    ]
}

@http(method: "POST", uri: "/api/search/names")
operation SearchFileNames {
    input: SearchFileNamesInput
    output: SearchFileNamesOutput
}

structure SearchFileNamesInput {
    @required
    @httpPayload
    query: String
}

structure SearchFileNamesOutput {
    @required
    results: PathsList
}

@http(method: "POST", uri: "/api/search/content")
operation SearchFileContent {
    input: SearchFileContentInput
    output: SearchFileContentOutput
}

structure SearchFileContentInput {
    @required
    @httpPayload
    query: String
}

structure SearchFileContentOutput {
    @required
    results: PathsList
}
