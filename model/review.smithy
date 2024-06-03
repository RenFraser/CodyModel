$version: "2"

namespace com.cody.model

resource Review {
    operations: [
        RequestSecurityReview
        RequestDesignReview
        RequestPerformanceReview
        RequestOperationsReview
        RequestTestReview
    ]
}

@http(method: "POST", uri: "/api/review/security")
operation RequestSecurityReview {
    input: RequestSecurityReviewInput
    output: RequestSecurityReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/design")
operation RequestDesignReview {
    input: RequestDesignReviewInput
    output: RequestDesignReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/performance")
operation RequestPerformanceReview {
    input: RequestPerformanceReviewInput
    output: RequestPerformanceReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/operations")
operation RequestOperationsReview {
    input: RequestOperationsReviewInput
    output: RequestOperationsReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/tests")
operation RequestTestReview {
    input: RequestTestReviewInput
    output: RequestTestReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
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
