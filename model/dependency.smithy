$version: "2"

namespace com.cody.model

resource Dependency {
    operations: [
        ListDependencies
        HasDependencies
    ]
}

@http(method: "GET", uri: "/api/dependencies/list")
operation ListDependencies {
    input: ListDependenciesInput
    output: ListDependenciesOutput
    errors: [
        ResourceNotFoundException
        DependenciesNotFoundException
        ResourceNotReadable
        InternalServerErrorException
    ]
}

@input
structure ListDependenciesInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure ListDependenciesOutput {
    @required
    dependencies: PathsList
}

@http(method: "GET", uri: "/api/dependencies")
operation HasDependencies {
    input: HasDependenciesInput
    output: HasDependenciesOutput
    errors: [
        ResourceNotFoundException
        ResourceNotReadable
        InternalServerErrorException
    ]
}

@input
structure HasDependenciesInput {
    @required
    @httpHeader("X-File-Path")
    path: String
}

@output
structure HasDependenciesOutput {
    @required
    dependencies: Boolean
}
