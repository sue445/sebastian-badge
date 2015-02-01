class PluginIndexer
  def initialize
    @plugins = Groonga["Plugins"]
  end

  def add(plugin)
    attributes = plugin.attributes
    id = attributes.delete("id")
    @plugins.add(id, attributes)
  end

  def remove(plugin)
    @plugins[plugin.id].delete
  end
end
