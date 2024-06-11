$version: "2"

namespace com.cody.model

string Path

list Paths {
    member: Path
}

resource File {
    identifiers: { path: Path }
    properties: { content: String }
    put: PutFile
    read: GetFile
    delete: DeleteFile
}

@idempotent
@http(method: "POST", uri: "/api/file")
operation PutFile with [StandardExceptions] {
    input := for File {
        @required
        $path

        @required
        $content
    }

    output := {}

    errors: [
        LocationNotWritable
        ContainingLocationNotFoundException
    ]
}

@readonly
@http(method: "GET", uri: "/api/file")
operation GetFile with [StandardExceptions] {
    input := for File {
        @required
        @httpHeader("X-File-Path")
        $path
    }

    output := for File {
        @required
        $content
    }

    errors: [
        ResourceNotReadable
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/file")
operation DeleteFile with [StandardExceptions] {
    input := for File {
        @required
        @httpHeader("X-File-Path")
        $path
    }

    output := {}
}

@readonly
@http(method: "GET", uri: "/api/file/list")
@paginated
operation ListFiles with [StandardExceptions] {
    input := for File {
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
        paths: Paths = []
    }

    errors: [
        ResourceNotReadable
    ]
}
