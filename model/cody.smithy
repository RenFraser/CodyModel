$version: "2"

namespace com.cody.model

use smithy.framework#ValidationException

@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "maxResults")
service Cody {
    version: "2024-06-02"
    resources: [
        Bedrock
        Dependency
        Directory
        File
        Repository
        Review
    ]
    errors: [
        ValidationException
    ]
}
