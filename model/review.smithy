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
operation CreateSecurityReview {
    input: CreateSecurityReviewInput
    output: CreateSecurityReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/design")
operation CreateDesignReview {
    input: CreateDesignReviewInput
    output: CreateDesignReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/performance")
operation CreatePerformanceReview {
    input: CreatePerformanceReviewInput
    output: CreatePerformanceReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/operations")
operation CreateOperationsReview {
    input: CreateOperationsReviewInput
    output: CreateOperationsReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@http(method: "POST", uri: "/api/review/tests")
operation CreateTestReview {
    input: CreateTestReviewInput
    output: CreateTestReviewOutput
    errors: [
        BadRequestException
        InternalServerErrorException
        NotImplementedException
    ]
}

@input
structure CreateSecurityReviewInput {
    @required
    content: String
}

@output
structure CreateSecurityReviewOutput {
    @required
    message: String
}

@input
structure CreateDesignReviewInput {
    @required
    content: String
}

@output
structure CreateDesignReviewOutput {
    @required
    message: String
}

@input
structure CreatePerformanceReviewInput {
    @required
    content: String
}

@output
structure CreatePerformanceReviewOutput {
    @required
    message: String
}

@input
structure CreateOperationsReviewInput {
    @required
    content: String
}

@output
structure CreateOperationsReviewOutput {
    @required
    message: String
}

@input
structure CreateTestReviewInput {
    @required
    content: String
}

@output
structure CreateTestReviewOutput {
    @required
    message: String
}
