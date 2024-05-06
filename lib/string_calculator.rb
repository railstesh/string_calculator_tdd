class StringCalculator
  def add(string)
    return 0 if string.empty?
		
		if invalid_input?(string)
      return "Invalid Input"
    end

    custom_delimiter = extract_custom_delimiter(string)
    separators = [",", "\n"]
    separators << custom_delimiter if custom_delimiter
    numbers = string.split(/#{Regexp.union(separators)}/).map(&:to_i)
    numbers.sum
  end

	private

  def invalid_input?(string)
    string.match(/,\n\z/)
  end

	def extract_custom_delimiter(string)
    match = string.match(/^\/\/(.)\n/)
    match[1] if match
  end
end
  