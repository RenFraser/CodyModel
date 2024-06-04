$version: "2"

namespace com.cody.model

resource Repository {
    identifiers: { path: String }
    operations: [
        GetDiff
        GetStatus
        CreateCommit
        ListCommits
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
        NotImplementedException
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
        NotImplementedException
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
operation CreateCommit {
    input: CreateCommitInput
    output: CreateCommitOutput
    errors: [
        ResourceNotFoundException
        NothingToCommitException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure CreateCommitInput {
    @required
    path: String

    @required
    message: String
}

@output
structure CreateCommitOutput {}

@readonly
@paginated
@http(method: "GET", uri: "/api/repository/commit/list")
operation ListCommits {
    input: ListCommitsInput
    output: ListCommitsOutput
    errors: [
        ResourceNotFoundException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure ListCommitsInput {
    @required
    @httpHeader("X-Repository-Path")
    path: String

    @httpQuery("limit")
    limit: Integer

    @httpHeader("X-Pagination-Token")
    nextToken: String

    @httpHeader("X-Max-Results")
    maxResults: Integer
}

@output
structure ListCommitsOutput {
    @required
    log: RepositoryLog = []

    nextToken: String
}

structure CommitDetails {
    @required
    author: String

    @required
    email: Email

    @required
    date: Timestamp

    @required
    shortMessage: String

    messageBody: String

    diff: String
}

list RepositoryLog {
    member: CommitDetails
}

@sensitive
@pattern("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$")
string Email
