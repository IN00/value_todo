# Value TODO

Sort todo by value and write new file: value_todo.md.

## Installation

Add this line to your application's Gemfile:

```gemfile
gem 'value_todo', git: 'https://github.com/IN00/value_todo.git', branch: 'main'
```

And then execute:

```bash
bundle
```

## Usage

Make todo.md under root directory anywhere.
todo.md needs to be formatted like the following code block.

```md
- [The level you should do for your goals (1..100) / estimate [1h]] todo content

- [10/1] read tech book

- [50/2] try to use new library
```

and run below command.

```bash
bundle exec value_todo
```

then write new file: value_todo.md in root directory.

```markdown
- [50/2] try to use new library
  - Value: 25, Path: [path/to/todo.md](path/to/todo.md)

- [10/1] read tech book
  - Value: 10, Path: [path/to/todo.md](path/to/todo.md)
```
