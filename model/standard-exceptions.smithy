$version: "2"

namespace com.cody.model

use smithy.api#documentation
use smithy.api#error
use smithy.api#httpError

@error("client")
@httpError(400)
@documentation("Indicates that the client sent an invalid or malformed request.")
structure BadRequestError {
    @required
    message: String
}

@error("client")
@httpError(401)
@documentation("Indicates that the client lacks proper authentication credentials to access the requested resource.")
structure UnauthorizedError {
    @required
    message: String
}

@error("client")
@httpError(403)
@documentation("Indicates that the client is authenticated but lacks sufficient permissions to access the requested resource.")
structure ForbiddenError {
    @required
    message: String
}

@error("client")
@httpError(404)
@documentation("Indicates that the requested resource could not be found on the server.")
structure ResourceNotFoundError {
    @required
    message: String
}

@error("client")
@httpError(409)
@documentation("Indicates a conflict or inconsistency in the request, such as trying to create a resource that already exists.")
structure ConflictError {
    @required
    message: String
}

@error("client")
@httpError(429)
@retryable
@documentation("Indicates the server has throttled the request.")
structure ThrottledError {
    @required
    message: String
}

@error("server")
@httpError(500)
@retryable
@documentation("Indicates a generic error on the server side, without providing specific details to the client.")
structure InternalServerError {
    @required
    message: String
}

@error("server")
@httpError(501)
@documentation("Indicates that the server does not support the functionality required to fulfill the request.")
structure NotImplementedError {
    @required
    message: String
}

@error("server")
@httpError(503)
@retryable
@documentation("Indicates that the server is currently unavailable, either due to maintenance or being overloaded.")
structure ServiceUnavailableError {
    @required
    message: String
}

@mixin
@suppress(["StandardOperationVerb"])
operation StandardExceptions {
    errors: [
        BadRequestError
        UnauthorizedError
        ForbiddenError
        ResourceNotFoundError
        ConflictError
        ThrottledError
        InternalServerError
        NotImplementedError
        ServiceUnavailableError
    ]
}
