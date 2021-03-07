# require 'active_support' だと to_json, blank? が生えなかったので /all を付与
require 'active_support/all'
require 'motion-markdown-it'

module ValueTodo
  class ParseTodoFileUseCase
    class << self
      # return Array[ParsedFile]
      def execute
        todo_paths_from_executing_directory.map do |path|
          file = File.open(path)
          parser = MarkdownIt::Parser.new(:commonmark, { html: false })
          markdown_it_tokens = parser.parse(file.read, {})
          file.close
          ParsedFile.new(path, markdown_it_tokens)
        end
      end

      private

      def todo_paths_from_executing_directory
        paths = Dir.glob('**/todo.md', File::FNM_DOTMATCH)
        raise Error, 'Not exists todo.md under execution position.' if paths.empty?

        paths
      end
    end
  end
end
