describe ValueTodo::InlineContent do
  describe '#value' do
    subject { described_class.new(content, 'path/to/todo.md').value }

    context 'when content do not fullfil format of value' do
      let(:content) { '' }

      it 'raise error' do
        expect { subject }.to raise_error StandardError
      end
    end

    context 'when content fullfil format of value' do
      let(:num1) { 1 }
      let(:num2) { 1 }
      let(:content) { "[#{num1}/#{num2}]" }

      it do
        is_expected.to eq num1 / num2
      end
    end

    context 'when content contain two format of value' do
      let(:num1) { 1 }
      let(:num2) { 1 }
      let(:content) { "[#{num1}/#{num2}] todo text [#{num1}/#{num2}]" }

      it do
        is_expected.to eq num1 / num2
      end
    end
  end
end
