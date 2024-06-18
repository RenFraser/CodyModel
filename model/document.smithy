$version: "2"

namespace com.cody.model

enum DocumentType {
    PDF
    CSV
}

structure Document {
    type: DocumentType
    content: Blob
}

list Documents {
    member: Document
}
