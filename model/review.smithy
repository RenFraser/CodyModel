$version: "2"

namespace com.cody.model

resource Review {
    properties: { content: String, message: String }
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
    input := for Review {
        @required
        $content
    }

    output := for Review {
        @required
        $message
    }
}

@http(method: "POST", uri: "/api/review/design")
operation CreateDesignReview with [StandardExceptions] {
    input := for Review {
        @required
        $content
    }

    output := for Review {
        @required
        $message
    }
}

@http(method: "POST", uri: "/api/review/performance")
operation CreatePerformanceReview with [StandardExceptions] {
    input := for Review {
        @required
        $content
    }

    output := for Review {
        @required
        $message
    }
}

@http(method: "POST", uri: "/api/review/operations")
operation CreateOperationsReview with [StandardExceptions] {
    input := for Review {
        @required
        $content
    }

    output := for Review {
        @required
        $message
    }
}

@http(method: "POST", uri: "/api/review/tests")
operation CreateTestReview with [StandardExceptions] {
    input := for Review {
        @required
        $content
    }

    output := for Review {
        @required
        $message
    }
}
