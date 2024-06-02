namespace com.cody.model

resource Directory {
    identifiers: { path: String },
    operations: [ ListDirectory ]
}

@http(method: "GET", uri: "/api/directory")
operation ListDirectory {
    input: ListDirectoryInput
    output: ListDirectoryOutput
}

@input
structure ListDirectoryInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure ListDirectoryOutput {
    @required
    paths: PathsList
}