object SemanticVersionConverter {
    fun convert(version: String): SemanticVersion {
        val parts = version.split(".")

        val major = parts[0].toInt()
        val minor = parts[1].toInt()
        val patch = parts[2].toInt()

        return SemanticVersion(
            major = major,
            minor = minor,
            patch = patch,
        )
    }
}