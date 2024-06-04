$version: "2"

namespace com.cody.model

resource Directory {
    identifiers: { path: String }
    operations: [
        CreateDirectory
        GetDirectory
    ]
}

@readonly
@http(method: "GET", uri: "/api/directory")
operation GetDirectory {
    input: GetDirectoryInput
    output: GetDirectoryOutput
    errors: [
        ResourceNotFoundException
        ResourceNotReadable
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure GetDirectoryInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure GetDirectoryOutput {
    @required
    paths: PathsList = []
}

@http(method: "POST", uri: "/api/directory")
operation CreateDirectory {
    input: CreateDirectoryInput
    output: CreateDirectoryOutput
    errors: [
        ConflictException
        LocationNotWritable
        ContainingLocationNotFoundException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure CreateDirectoryInput {
    @required
    @httpHeader("X-Directory-Path")
    path: String
}

@output
structure CreateDirectoryOutput {}
