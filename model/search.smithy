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
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
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
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
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
