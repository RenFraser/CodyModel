$version: "2"

namespace com.cody.model

use aws.protocols#restJson1

@restJson1
@auth([])
service Cody {
    version: "2024-06-02"
    resources: [
        Bedrock
        Dependency
        Directory
        File
        Review
        Search
    ]
}
