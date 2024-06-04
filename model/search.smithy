$version: "2"

namespace com.cody.model

resource Search {
    operations: [
        SearchFileNames
        SearchFileContent
    ]
}

@http(method: "POST", uri: "/api/search/names")
@paginated
operation SearchFileNames {
    input: SearchFileNamesInput
    output: SearchFileNamesOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure SearchFileNamesInput {
    @required
    query: String

    nextToken: String

    maxResults: Integer
}

@output
structure SearchFileNamesOutput {
    @required
    results: PathsList = []

    nextToken: String
}

@http(method: "POST", uri: "/api/search/content")
@paginated
operation SearchFileContent {
    input: SearchFileContentInput
    output: SearchFileContentOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure SearchFileContentInput {
    @required
    @httpPayload
    query: String

    @httpHeader("X-Pagination-Token")
    nextToken: String

    @httpHeader("X-Max-Results")
    maxResults: Integer
}

@output
structure SearchFileContentOutput {
    @required
    results: PathsList = []

    nextToken: String
}
