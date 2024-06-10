import kotlin.test.assertFalse
import kotlin.test.assertTrue
import org.junit.jupiter.api.Test

class SemanticVersionStringValidatorTest {

    @Test
    fun `isValid should return true for valid semantic versions`() {
        val validVersions = listOf(
            "0.0.0",
            "1.2.3",
            "10.20.30",
            "1.0.0",
            "0.1.0",
            "0.0.1"
        )

        validVersions.forEach { version ->
            assertTrue(SemanticVersionStringValidator.isValid(version))
        }
    }

    @Test
    fun `isValid should return false for invalid semantic versions`() {
        val invalidVersions = listOf(
            "",
            "1",
            "1.2",
            "1.2.3.4",
            "a.b.c",
            "1.0.0-alpha", // pre-release version
            "1.0.0+build123", // build metadata
            "-1.0.0",
            "0.-1.0",
            "0.0.-1"
        )

        invalidVersions.forEach { version ->
            assertFalse(SemanticVersionStringValidator.isValid(version))
        }
    }
}