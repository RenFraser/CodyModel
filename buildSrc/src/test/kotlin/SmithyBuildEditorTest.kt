import com.google.gson.Gson
import com.google.gson.JsonObject
import org.junit.jupiter.api.AfterEach
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import java.io.File

class SmithyBuildEditorTest {
    private lateinit var tempFile: File
    private lateinit var editor: SmithyBuildEditor
    private val gson = Gson()

    @BeforeEach
    fun setup() {
        tempFile = File.createTempFile("test", ".json")
        editor = SmithyBuildEditor(tempFile)
    }

    @AfterEach
    fun cleanup() {
        tempFile.delete()
    }

    @Test
    fun `updatePackageVersions should update package versions in JSON file`() {
        val initialContent = """
            {
              "plugins": {
                "typescript-client-codegen": {
                  "packageVersion": "0.0.1"
                },
                "typescript-server-codegen": {
                  "packageVersion": "0.0.1"
                }
              }
            }
        """.trimIndent()
        tempFile.writeText(initialContent)

        val newVersion = SemanticVersion(1, 2, 3)
        editor.updatePackageVersions(newVersion)

        val updatedContent = tempFile.readText()
        val updatedJsonObject = gson.fromJson(updatedContent, JsonObject::class.java)
        val plugins = updatedJsonObject.getAsJsonObject("plugins")

        plugins.entrySet().forEach { (_, pluginConfig) ->
            val pluginJsonObject = pluginConfig.asJsonObject
            assertEquals(newVersion.toString(), pluginJsonObject.get("packageVersion").asString)
        }
    }
}