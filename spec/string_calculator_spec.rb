require 'string_calculator'

describe StringCalculator do
  subject(:string_calculator) {described_class.new}

  describe "#add" do
    it 'returns 0 for an empty string' do
    	expect(string_calculator.add("")).to eq(0)
    end

    it 'returns the number for single parameter' do
      expect(string_calculator.add("1")).to eq(1)
    end

		it 'returns the sum for two parameters' do
      expect(string_calculator.add("1,2")).to eq(3)
    end

    it 'returns the sum for two parameters with additional strings' do
      expect(string_calculator.add("1,2,3,4,5")).to eq(15)
    end

		it 'will handle new line in parameter' do
      expect(string_calculator.add("1,2\n3")).to eq(6)
    end

    it 'retruns error msg if parameter includes ,\n at end' do
      expect(string_calculator.add("1,2,3,\n")).to eq("Invalid Input")
    end

		it 'can accept delimiters in following format "//[delimiter]\n"' do
      expect(string_calculator.add("//;\n1;2")).to eq(3)
    end

		it 'should throw exception for negative numbers' do
      expect { string_calculator.add("-1") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
      expect { string_calculator.add("-1, 2") }.to raise_error(RuntimeError, "negative numbers not allowed -1")
      expect { string_calculator.add("-1, -2") }.to raise_error(RuntimeError, "negative numbers not allowed -1,-2")
    end
  end
end
