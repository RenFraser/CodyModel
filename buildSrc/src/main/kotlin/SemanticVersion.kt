data class SemanticVersion(
    val major: Int,
    val minor: Int,
    val patch: Int
) {

    init {
        require(major >= 0) { "Major version must be a non-negative integer." }
        require(minor >= 0) { "Minor version must be a non-negative integer." }
        require(patch >= 0) { "Patch version must be a non-negative integer." }
    }

    override fun toString(): String {
        return "$major.$minor.$patch"
    }
}