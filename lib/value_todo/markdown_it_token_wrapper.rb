module ValueTodo
  class MarkdownItTokenWrapper
    # MarkdownIt::Tokenが持ちうるプロパティーの中で以下に関心がある
    # [markdown-it 12.0.4 API documentation | Token (class)](https://markdown-it.github.io/markdown-it/#Token)
    # :type, :content, :other_token_key

    attr_reader :markdown_it_token

    TYPES = {
      inline: 'inline'
    }.freeze

    def initialize(markdown_it_token)
      @markdown_it_token = markdown_it_token
    end

    def inline_type?
      markdown_it_token.type == TYPES[:inline]
    end

    def content
      markdown_it_token.content
    end
  end
end
