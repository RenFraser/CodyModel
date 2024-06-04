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
            verbs: ["Create", "Get", "List", "Update", "Delete", "Search", "Send", "Patch", "Bulk", "Validate"]
        }
    }
    {
        name: "RepeatedShapeName"
    }
    {
        name: "InputOutputStructureReuse"
    }
    // TODO: paginated trait
    //    {
    //        name: "MissingPaginatedTrait"
    //    }
    {
        name: "ShouldHaveUsedTimestamp"
    }
    {
        name: "MissingClientOptionalTrait"
    }
]
