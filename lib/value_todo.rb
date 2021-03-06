# ----------------------------------------------------------------------------------------------------- #
# [fxn/zeitwerk: Efficient and thread-safe code loader for Ruby](https://github.com/fxn/zeitwerk#for_gem)
# ----------------------------------------------------------------------------------------------------- #
require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module ValueTodo
  class Error < StandardError; end
end

# ----------------------------------------------------------------------------------------------------- #
# Bundler
# ----------------------------------------------------------------------------------------------------- #

# TODO:
# できれば以下のようにしてrequireしないようにしたい
# Bundler.require
