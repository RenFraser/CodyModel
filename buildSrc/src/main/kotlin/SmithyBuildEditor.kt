import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File

class SmithyBuildEditor(private val file: File) {
    private val gson = GsonBuilder().setPrettyPrinting().create()

    fun updatePackageVersions(newVersion: SemanticVersion) {
        val fileContent = file.readText()
        val jsonObject = gson.fromJson(fileContent, JsonObject::class.java)

        val plugins = jsonObject.getAsJsonObject("plugins")

        plugins.entrySet().forEach { (_, pluginConfig) ->
            val pluginJsonObject = pluginConfig.asJsonObject
            pluginJsonObject.addProperty("packageVersion", newVersion.toString())
        }

        val updatedContent = gson.toJson(jsonObject)
        file.writeText(updatedContent)
    }
}