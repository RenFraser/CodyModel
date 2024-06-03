$version: "2"

namespace com.cody.model

resource Repository {
    identifiers: { path: String }
    operations: [
        GetDiff
        GetStatus
        CommitChanges
        GetLog
    ]
}

@readonly
@http(method: "GET", uri: "/api/repository/diff")
operation GetDiff {
    input: GetDiffInput
    output: GetDiffOutput
    errors: [
        ResourceNotFoundException
        InternalServerErrorException
    ]
}

@input
structure GetDiffInput {
    @required
    @httpHeader("X-Repository-Path")
    path: String
}

@output
structure GetDiffOutput {
    @required
    diff: String
}

@readonly
@http(method: "GET", uri: "/api/repository/status")
operation GetStatus {
    input: GetStatusInput
    output: GetStatusOutput
    errors: [
        ResourceNotFoundException
        InternalServerErrorException
    ]
}

@input
structure GetStatusInput {
    @required
    @httpHeader("X-Repository-Path")
    path: String
}

@output
structure GetStatusOutput {
    @required
    status: String
}

@http(method: "POST", uri: "/api/repository/commit")
operation CommitChanges {
    input: CommitChangesInput
    output: CommitChangesOutput
    errors: [
        ResourceNotFoundException
        NothingToCommitException
        InternalServerErrorException
    ]
}

@input
structure CommitChangesInput {
    @required
    path: String

    @required
    message: String
}

@output
structure CommitChangesOutput {}

@readonly
@http(method: "GET", uri: "/api/repository/log")
operation GetLog {
    input: GetLogInput
    output: GetLogOutput
    errors: [
        ResourceNotFoundException
        InternalServerErrorException
    ]
}

@input
structure GetLogInput {
    @required
    @httpHeader("X-Repository-Path")
    path: String

    @httpQuery("limit")
    limit: Integer
}

@output
structure GetLogOutput {
    @required
    log: RepositoryLog
}

string CommitDetails

list RepositoryLog {
    member: CommitDetails
}
