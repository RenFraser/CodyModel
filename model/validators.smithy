metadata validators = [
    {
        name: "UnreferencedShape"
    }
    {
        name: "AbbreviationName"
    }
    {
        name: "CamelCase"
    }
    {
        name: "MissingSensitiveTrait"
    }
    {
        name: "NoninclusiveTerms"
    }
    {
        name: "ReservedWords"
    }
    {
        name: "StandardOperationVerb"
        configuration: {
            verbs: ["Create", "Get", "List", "Update", "Delete", "Search", "Send", "Patch", "Put", "Bulk", "Validate"]
        }
    }
    {
        name: "RepeatedShapeName"
    }
    {
        name: "InputOutputStructureReuse"
    }
    {
        name: "MissingPaginatedTrait"
    }
    {
        name: "ShouldHaveUsedTimestamp"
    }
    {
        name: "MissingClientOptionalTrait"
    }
]

metadata severityOverrides = [
    {
        namespace: "*"
        id: "HttpMethodSemantics"
        severity: "DANGER"
    }
]
