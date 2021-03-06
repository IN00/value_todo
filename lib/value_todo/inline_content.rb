module ValueTodo
  class InlineContent
    attr_reader :content, :file_path

    VALUE_CONTENT_REGEXP = %r{^\[[0-9]*\/[0-9]*\].*$}.freeze
    VALUE_PREFIX_REGEXP = %r{^\[[0-9]*\/[0-9]*\]}.freeze

    def initialize(content, file_path)
      @content = content
      @file_path = file_path
    end

    def value_todo?
      content.match?(VALUE_CONTENT_REGEXP)
    end

    def value
      raise Error, 'contentは[number/number]のフォーマットではありません' unless value_todo?

      value_and_estimate = content.match(VALUE_PREFIX_REGEXP)[0].gsub('[', '').gsub(']', '').split('/')
      value_and_estimate[0].to_i / value_and_estimate[1].to_i.to_f
    end
  end
end
