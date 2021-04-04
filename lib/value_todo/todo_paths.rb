module ValueTodo
  class TodoPaths
    attr_reader :paths

    # valut_todo は rootフォルダー内でも実行される事もあるので、include機能を入れる
    def initialize(included_paths:, ignored_dirs:)
      @paths =
        Dir.glob(included_paths).reject do |path|
          ignored_dirs.any? do |dir|
            path.include?(dir)
          end
        end

      raise Error, 'Not exists todo.md under execution position.' if @paths.empty?
    end
  end
end

# 実装時に分かった事

# Dir.glob
# デフォルトの設定で大文字小文字の区別をしない。
# File::FNM_CASEFOLD フラグがあるものの、上記を考慮するフラグは無い

# require 'rake'
# FileList
# Dir.glob と違って以下の例外を発生しない
# Errno::EPERM: Operation not permitted - Library/Application Support/MobileSync

# 使い方
# FileList.new("**/*/todo.md") do |f|
#   f.exclude("**/node_modules/**/*.md")
# end
