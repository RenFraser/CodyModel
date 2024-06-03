$version: "2"

namespace com.cody.model

use smithy.api#documentation
use smithy.api#error
use smithy.api#httpError

@error("client")
@httpError(400)
@documentation("Indicates that the client sent an invalid or malformed request.")
structure BadRequestException {
    @required
    message: String
}

@error("client")
@httpError(401)
@documentation("Indicates that the client lacks proper authentication credentials to access the requested resource.")
structure UnauthorizedException {
    @required
    message: String
}

@error("client")
@httpError(403)
@documentation("Indicates that the client is authenticated but lacks sufficient permissions to access the requested resource.")
structure ForbiddenException {
    @required
    message: String
}

@error("client")
@httpError(404)
@documentation("Indicates that the requested resource could not be found on the server.")
structure NotFoundException {
    @required
    message: String
}

@error("client")
@httpError(405)
@documentation("Indicates that the HTTP method used in the request is not supported for the requested resource.")
structure MethodNotAllowedException {
    @required
    message: String
}

@error("client")
@httpError(406)
@documentation("Indicates that the server cannot produce a response matching the list of acceptable values defined in the request's Accept headers.")
structure NotAcceptableException {
    @required
    message: String
}

@error("client")
@httpError(409)
@documentation("Indicates a conflict or inconsistency in the request, such as trying to create a resource that already exists.")
structure ConflictException {
    @required
    message: String
}

@error("client")
@httpError(415)
@documentation("Indicates that the server does not support the media type specified in the request's Content-Type header.")
structure UnsupportedMediaTypeException {
    @required
    message: String
}

@error("client")
@httpError(422)
@documentation("Indicates that the server understands the content type of the request entity but was unable to process the contained instructions.")
structure UnprocessableEntityException {
    @required
    message: String
}

@error("server")
@httpError(500)
@retryable
@documentation("Indicates a generic error on the server side, without providing specific details to the client.")
structure InternalServerErrorException {
    @required
    message: String
}

@error("server")
@httpError(501)
@documentation("Indicates that the server does not support the functionality required to fulfill the request.")
structure NotImplementedException {
    @required
    message: String
}

@error("server")
@httpError(503)
@retryable
@documentation("Indicates that the server is currently unavailable, either due to maintenance or being overloaded.")
structure ServiceUnavailableException {
    @required
    message: String
}
