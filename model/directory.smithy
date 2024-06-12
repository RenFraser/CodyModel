$version: "2"

namespace com.cody.model

resource Directory {
    identifiers: { path: String }
    put: PutDirectory
}

@idempotent
@http(method: "POST", uri: "/api/directory")
operation PutDirectory {
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
