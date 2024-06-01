class CommandGenerator < Rails::Generators::NamedBase
  class_option :scope, type: :string

  source_root File.expand_path("templates", __dir__)

  def copy_command_file
    path = ["app", "commands", options["scope"], "#{file_name}.rb"].compact.join("/")
    template "command.rb", path
  end
end
