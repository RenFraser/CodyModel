$version: "2"

namespace com.cody.model

use smithy.framework#ValidationException

service Cody {
    version: "2024-06-02"
    resources: [
        Bedrock
        Dependency
        Directory
        File
        Repository
        Review
        Search
    ]
    errors: [
        ValidationException
    ]
}
