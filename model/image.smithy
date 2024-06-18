$version: "2"

namespace com.cody.model

enum ImageType {
    JPEG = "image/jpeg"
    PNG = "image/png"
    WEBP = "image/webp"
    GIF = "image/gif"
}

structure Image {
    type: ImageType
    content: Blob
}

list Images {
    member: Image
}
