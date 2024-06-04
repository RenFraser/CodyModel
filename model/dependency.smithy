$version: "2"

namespace com.cody.model

resource Dependency {
    operations: [
        ListDependencies
    ]
}

@readonly
@http(method: "GET", uri: "/api/dependencies/list")
@paginated
operation ListDependencies {
    input: ListDependenciesInput
    output: ListDependenciesOutput
    errors: [
        ResourceNotFoundException
        DependenciesNotFoundException
        ResourceNotReadable
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure ListDependenciesInput {
    @required
    @httpHeader("X-File-Path")
    path: String

    @httpHeader("X-Pagination-Token")
    nextToken: String

    @httpHeader("X-Max-Results")
    maxResults: Integer
}

@output
structure ListDependenciesOutput {
    @required
    dependencies: PathsList = []

    nextToken: String
}
