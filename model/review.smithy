$version: "2"

namespace com.cody.model

enum ReviewType {
    SECURITY
    DESIGN
    PERFORMANCE
    OPERATIONS
    TEST
}

resource Review {
    properties: { code: String, type: ReviewType, diff: String, message: String }
    put: PutReview
}

@idempotent
@http(method: "PUT", uri: "/api/review")
operation PutReview with [StandardExceptions] {
    input := for Review {
        @required
        $code

        @required
        $type

        $diff
    }

    output := for Review {
        @required
        $message
    }
}
