import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotEquals

class SemanticVersionTest {

    @Test
    fun `toString should return correct format`() {
        val version = SemanticVersion(1, 2, 3)
        assertEquals("1.2.3", version.toString())
    }

    @Test
    fun `constructor should create SemanticVersion with valid version numbers`() {
        val version = SemanticVersion(1, 2, 3)
        assertEquals(1, version.major)
        assertEquals(2, version.minor)
        assertEquals(3, version.patch)
    }

    @Test
    fun `constructor should create SemanticVersion with zero version numbers`() {
        val version = SemanticVersion(0, 0, 0)
        assertEquals(0, version.major)
        assertEquals(0, version.minor)
        assertEquals(0, version.patch)
    }

    @Test
    fun `constructor should throw IllegalArgumentException when major version is negative`() {
        assertFailsWith<IllegalArgumentException> {
            SemanticVersion(-1, 0, 0)
        }
    }

    @Test
    fun `constructor should throw IllegalArgumentException when minor version is negative`() {
        assertFailsWith<IllegalArgumentException> {
            SemanticVersion(0, -1, 0)
        }
    }

    @Test
    fun `constructor should throw IllegalArgumentException when patch version is negative`() {
        assertFailsWith<IllegalArgumentException> {
            SemanticVersion(0, 0, -1)
        }
    }

    @Test
    fun `equals should return true when versions are equal`() {
        val version1 = SemanticVersion(1, 2, 3)
        val version2 = SemanticVersion(1, 2, 3)
        assertEquals(version1, version2)
    }

    @Test
    fun `equals should return false when versions are not equal`() {
        val version1 = SemanticVersion(1, 2, 3)
        val version2 = SemanticVersion(1, 2, 4)
        assertNotEquals(version1, version2)
    }

    @Test
    fun `copy should create a new instance with the same version numbers`() {
        val version1 = SemanticVersion(1, 2, 3)
        val version2 = version1.copy()
        assertEquals(version1, version2)
    }

    @Test
    fun `copy should create a new instance with modified version numbers when using named arguments`() {
        val version1 = SemanticVersion(1, 2, 3)
        val version2 = version1.copy(patch = 4)
        assertEquals(SemanticVersion(1, 2, 4), version2)
    }
}