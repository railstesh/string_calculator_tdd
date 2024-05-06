class StringCalculator
  def add(string)
    return 0 if string.empty?
		
		if invalid_input?(string)
      return "Invalid Input"
    end

    separators = [",", "\n"]
    numbers = string.split(/#{Regexp.union(separators)}/).map(&:to_i)
    numbers.sum
  end

	private

  def invalid_input?(string)
    string.match(/,\n\z/)
  end
end
  