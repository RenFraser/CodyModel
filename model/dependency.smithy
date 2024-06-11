$version: "2"

namespace com.cody.model

// TODO: list
resource Dependency {
    operations: [
        ListDependencies
    ]
}

@readonly
@http(method: "GET", uri: "/api/dependencies/list")
@paginated
operation ListDependencies with [StandardExceptions] {
    input := for Dependency {
        @required
        @httpHeader("X-File-Path")
        path: String

        @httpHeader("X-Pagination-Token")
        nextToken: String

        @httpHeader("X-Max-Results")
        maxResults: Integer
    }

    output := {
        @required
        dependencies: PathsList = []

        nextToken: String
    }

    errors: [
        DependenciesNotFoundException
        ResourceNotReadable
    ]
}
