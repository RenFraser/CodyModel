$version: "2"

namespace com.cody.model

@error("client")
@httpError(400)
structure InputLimitExceededException {
    @required
    message: String
}

@error("client")
@httpError(400)
structure UnexpectedMessageTypeError {
    @required
    message: String
}

@error("client")
@httpError(404)
structure ResourceNotFoundException {
    @required
    message: String
}

@error("client")
@httpError(404)
structure ContainingLocationNotFoundException {
    @required
    message: String
}

@error("client")
@httpError(404)
structure DependenciesNotFoundException {
    @required
    message: String
}

@error("client")
@httpError(400)
structure LocationNotWritable {
    @required
    message: String
}

@error("client")
@httpError(400)
structure ResourceNotReadable {
    @required
    message: String
}

// TODO: collect these sorts of blanket errors and apply them to all operations.
// TODO: bad request, and others?
@error("server")
@httpError(500)
structure InternalServiceException {
    @required
    message: String
}


