$version: "2"

namespace com.cody.model

resource Review {
    operations: [
        CreateSecurityReview
        CreateDesignReview
        CreatePerformanceReview
        CreateOperationsReview
        CreateTestReview
    ]
}

@http(method: "POST", uri: "/api/review/security")
operation CreateSecurityReview with [StandardExceptions] {
    input := {
        @required
        content: String
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/review/design")
operation CreateDesignReview with [StandardExceptions] {
    input := {
        @required
        content: String
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/review/performance")
operation CreatePerformanceReview with [StandardExceptions] {
    input := {
        @required
        content: String
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/review/operations")
operation CreateOperationsReview with [StandardExceptions] {
    input := {
        @required
        content: String
    }

    output := {
        @required
        message: String
    }
}

@http(method: "POST", uri: "/api/review/tests")
operation CreateTestReview with [StandardExceptions] {
    input := {
        @required
        content: String
    }

    output := {
        @required
        message: String
    }
}
