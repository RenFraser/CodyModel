object SemanticVersionStringValidator {
    private val regex = Regex("^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)$")

    fun isValid(version: String): Boolean {
        return regex.matches(version)
    }
}