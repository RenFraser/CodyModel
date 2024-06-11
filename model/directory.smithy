$version: "2"

namespace com.cody.model

// TODO: use the list operation in Files resource instead of dir
// TODO: bind to lifecycle operations: https://smithy.io/2.0/spec/service-types.html#resource-lifecycle-operations
resource Directory {
    identifiers: { path: String }
    operations: [
        CreateDirectory
        GetDirectory
    ]
}

@readonly
@http(method: "GET", uri: "/api/directory")
@paginated
operation GetDirectory with [StandardExceptions] {
    input := for Directory {
        @required
        @httpHeader("X-File-Path")
        $path

        @httpHeader("X-Pagination-Token")
        nextToken: String

        @httpHeader("X-Max-Results")
        maxResults: Integer
    }

    output := {
        nextToken: String

        @required
        paths: PathsList = []
    }

    errors: [
        ResourceNotReadable
    ]
}

@http(method: "POST", uri: "/api/directory")
operation CreateDirectory {
    input := for Directory {
        @required
        @httpHeader("X-Directory-Path")
        $path
    }

    output := {}

    errors: [
        LocationNotWritable
        ContainingLocationNotFoundException
    ]
}
