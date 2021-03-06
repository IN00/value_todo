module ValueTodo
  class ParsedFile
    attr_reader :file_path, :markdown_it_token_wrappers

    def initialize(file_path, markdown_it_tokens)
      @file_path = file_path
      @markdown_it_token_wrappers = markdown_it_tokens.map do |markdown_it_token|
        MarkdownItTokenWrapper.new(markdown_it_token)
      end
    end

    # h1のtextもinline typeなので注意
    #
    # # this is INLINE
    #
    # - this is INLINE
    #
    # return Array[MarkdownItTokenWrapper]
    def inline_type_markdown_it_token_wrappers
      markdown_it_token_wrappers.select(&:inline_type?)
    end
  end
end
