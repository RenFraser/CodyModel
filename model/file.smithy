$version: "2"

namespace com.cody.model

resource File {
    identifiers: { path: String }
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
