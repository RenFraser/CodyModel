namespace com.cody.model

resource Review {
    operations: [
        RequestSecurityReview,
        RequestDesignReview,
        RequestPerformanceReview,
        RequestOperationsReview,
        RequestTestReview
    ]
}

@http(method: "POST", uri: "/api/review/security")
operation RequestSecurityReview {
    input: RequestSecurityReviewInput
    output: RequestSecurityReviewOutput
}

@http(method: "POST", uri: "/api/review/design")
operation RequestDesignReview {
    input: RequestDesignReviewInput
    output: RequestDesignReviewOutput
}

@http(method: "POST", uri: "/api/review/performance")
operation RequestPerformanceReview {
    input: RequestPerformanceReviewInput
    output: RequestPerformanceReviewOutput
}

@http(method: "POST", uri: "/api/review/operations")
operation RequestOperationsReview {
    input: RequestOperationsReviewInput
    output: RequestOperationsReviewOutput
}

@http(method: "POST", uri: "/api/review/tests")
operation RequestTestReview {
    input: RequestTestReviewInput
    output: RequestTestReviewOutput
}

@input
structure RequestSecurityReviewInput {
    @required
    content: String
}

@output
structure RequestSecurityReviewOutput {
    @required
    message: String
}

@input
structure RequestDesignReviewInput {
    @required
    content: String
}

@output
structure RequestDesignReviewOutput {
    @required
    message: String
}

@input
structure RequestPerformanceReviewInput {
    @required
    content: String
}

@output
structure RequestPerformanceReviewOutput {
    @required
    message: String
}

@input
structure RequestOperationsReviewInput {
    @required
    content: String
}

@output
structure RequestOperationsReviewOutput {
    @required
    message: String
}

@input
structure RequestTestReviewInput {
    @required
    content: String
}

@output
structure RequestTestReviewOutput {
    @required
    message: String
}