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
operation SearchFileNames with [StandardExceptions] {
    input := {
        @required
        query: String

        nextToken: String

        maxResults: Integer
    }

    output := {
        @required
        results: Paths = []

        nextToken: String
    }
}

@http(method: "POST", uri: "/api/search/content")
@paginated
operation SearchFileContent with [StandardExceptions] {
    input := {
        @required
        @httpPayload
        query: String

        @httpHeader("X-Pagination-Token")
        nextToken: String

        @httpHeader("X-Max-Results")
        maxResults: Integer
    }

    output := {
        @required
        results: Paths = []

        nextToken: String
    }
}
