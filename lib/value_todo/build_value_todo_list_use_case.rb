require 'yaml'

module ValueTodo
  # CD配下に存在する todo.md の value_todo.md を CD配下に作成します。
  class BuildValueTodoListUseCase
    class << self
      def execute
        config = ::YAML.load_file('value_todo_config.yml')
        paths = TodoPaths.new(included_paths: config['included_paths'], ignored_dirs: config['ignored_dirs']).paths

        raise Error, 'Not exists todo.md under execution position.' if paths.empty?

        parsed_files = ParseTodoFileUseCase.execute(paths: paths)

        inline_contents = parsed_files.flat_map do |parsed_file|
          parsed_file.inline_type_markdown_it_token_wrappers.map do |inline_type_markdown_it_token_wrapper|
            InlineContent.new(inline_type_markdown_it_token_wrapper.content, parsed_file.file_path)
          end
        end

        f = File.new('value_todo.md', 'w')
        f.write(
          "# Value TODO\n\n" +
          inline_contents.select(&:value_todo?).sort { |a, b| b.value <=> a.value }.map do |inline_content|
            value_todo(inline_content)
          end.join("\n")
        )
        f.close
      end

      private

      def value_todo(inline_content)
        <<~TEXT
          - #{inline_content.content}
            - Value: #{inline_content.value}, Path: [#{inline_content.file_path}](#{inline_content.file_path})
        TEXT
      end
    end
  end
end
