# require 'active_support' だと to_json, blank? が生えなかったので /all を付与
require 'active_support/all'
require 'motion-markdown-it'

module ValueTodo
  class ParseTodoFileUseCase
    class << self
      # return Array[ParsedFile]
      def execute(paths:)
        paths.map do |path|
          file = File.open(path)
          parser = MarkdownIt::Parser.new(:commonmark, { html: false })
          markdown_it_tokens = parser.parse(file.read, {})
          file.close
          ParsedFile.new(path, markdown_it_tokens)
        end
      end
    end
  end
end
