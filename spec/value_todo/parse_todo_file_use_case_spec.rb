describe ValueTodo::ParseTodoFileUseCase do
  subject { described_class.execute }

  context 'when not exist todo.md in project' do
    before do
      allow(Dir).to receive(:glob).and_return([])
    end

    it do
      expect { subject }.to raise_error do |e|
        expect(e.message).to eq 'Not exists todo.md under execution position.'
      end
    end
  end

  context 'when exist todo.md in project' do
    before do
      allow(Dir).to receive(:glob).and_return(['path/to/todo.md'])
      mock = instance_double(File)
      allow(File).to receive(:open).and_return(mock)
      allow(mock).to receive(:read)
      allow(mock).to receive(:close)
      markdown_it_parser_mock = instance_double(MarkdownIt::Parser)
      allow(markdown_it_parser_mock).to receive(:parse)
      allow(MarkdownIt::Parser).to receive(:new).and_return(markdown_it_parser_mock)
      allow(ValueTodo::ParsedFile).to receive(:new)
    end

    it { expect(subject.class).to eq Array }
  end
end
