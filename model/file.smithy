$version: "2"

namespace com.cody.model

resource File {
    identifiers: { path: String }
    operations: [
        CreateFile
        ReadFile
        UpdateFile
        DeleteFile
    ]
}

@http(method: "POST", uri: "/api/file")
operation CreateFile {
    input: CreateFileInput
    output: CreateFileOutput
    errors: [
        ConflictException
        LocationNotWritable
        ContainingLocationNotFoundException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure CreateFileInput {
    @required
    path: String

    @required
    content: String
}

@output
structure CreateFileOutput {}

@readonly
@http(method: "GET", uri: "/api/file")
operation ReadFile {
    input: ReadFileInput
    output: ReadFileOutput
    errors: [
        ResourceNotFoundException
        ResourceNotReadable
        BadRequestException
        NotImplementedException
        InternalServerErrorException
    ]
}

@input
structure ReadFileInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure ReadFileOutput {
    @required
    content: String
}

@idempotent
@http(method: "PUT", uri: "/api/file")
operation UpdateFile {
    input: UpdateFileInput
    output: UpdateFileOutput
    errors: [
        ConflictException
        ResourceNotFoundException
        LocationNotWritable
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure UpdateFileInput {
    @required
    path: String

    @required
    content: String
}

@output
structure UpdateFileOutput {}

@idempotent
@http(method: "DELETE", uri: "/api/file")
operation DeleteFile {
    input: DeleteFileInput
    output: DeleteFileOutput
    errors: [
        ConflictException
        ResourceNotFoundException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure DeleteFileInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure DeleteFileOutput {}
