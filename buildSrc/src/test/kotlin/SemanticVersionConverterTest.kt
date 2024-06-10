import kotlin.test.assertEquals
import org.junit.jupiter.api.Test

class SemanticVersionConverterTest {

    @Test
    fun `parse should return SemanticVersion object for valid version string`() {
        val validVersionStrings = listOf(
            "0.0.0",
            "1.2.3",
            "10.20.30"
        )

        val expectedVersions = listOf(
            SemanticVersion(0, 0, 0),
            SemanticVersion(1, 2, 3),
            SemanticVersion(10, 20, 30)
        )

        validVersionStrings.zip(expectedVersions).forEach { (versionString, expectedVersion) ->
            val parsedVersion = SemanticVersionConverter.convert(versionString)
            assertEquals(expectedVersion, parsedVersion)
        }
    }
}