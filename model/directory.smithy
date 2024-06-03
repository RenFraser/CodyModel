$version: "2"

namespace com.cody.model

resource Directory {
    identifiers: { path: String }
    operations: [
        CreateDirectory
        ReadDirectory
    ]
}

@readonly
@http(method: "GET", uri: "/api/directory")
operation ReadDirectory {
    input: ReadDirectoryInput
    output: ReadDirectoryOutput
    errors: [
        ResourceNotFoundException
        ResourceNotReadable
        InternalServerErrorException
    ]
}

@input
structure ReadDirectoryInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure ReadDirectoryOutput {
    @required
    paths: PathsList
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
