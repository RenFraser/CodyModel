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
operation GetDiff with [StandardExceptions] {
    input := for Repository {
        @required
        @httpHeader("X-Repository-Path")
        $path
    }

    output := {
        @required
        diff: String
    }
}

@readonly
@http(method: "GET", uri: "/api/repository/status")
operation GetStatus with [StandardExceptions] {
    input := for Repository {
        @required
        @httpHeader("X-Repository-Path")
        $path
    }

    output := {
        @required
        status: String
    }
}

@http(method: "POST", uri: "/api/repository/commit")
operation CreateCommit with [StandardExceptions] {
    input := {
        @required
        path: String

        @required
        message: String
    }

    output := {}

    errors: [
        NothingToCommitException
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/repository/commit/list")
operation ListCommits with [StandardExceptions] {
    input := {
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

    output := {
        @required
        log: RepositoryLog = []

        nextToken: String
    }
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
