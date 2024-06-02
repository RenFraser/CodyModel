namespace com.cody.model

resource Dependency {
    operations: [
        ResolveDependencies
    ]
}

@http(method: "POST", uri: "/api/dependencies")
operation ResolveDependencies {
    input: ResolveDependenciesInput
    output: ResolveDependenciesOutput
}

@input
structure ResolveDependenciesInput {
    @required
    @httpPayload
    path: String
}

@output
structure ResolveDependenciesOutput {
    @required
    dependencies: PathsList
}
