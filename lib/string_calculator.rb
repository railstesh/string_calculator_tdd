class StringCalculator
  def add(string)
    return 0 if string.empty?
    return "Invalid Input" if invalid_input?(string)

    custom_delimiter = extract_custom_delimiter(string)
    separators = [",", "\n"]
    separators << custom_delimiter if custom_delimiter

    numbers = parse_numbers(string, separators)
    raise_negative_error(numbers)

    numbers.sum
  end

	private

  def invalid_input?(string)
    string.end_with?(",\n")
  end

  def extract_custom_delimiter(string)
    string.match(/^\/\/(.)\n/)&.captures&.first
  end

  def parse_numbers(string, separators)
    string.split(/#{Regexp.union(separators)}/).map(&:to_i)
  end

  def raise_negative_error(numbers)
    negative_numbers = numbers.select { |num| num.negative? }
    raise "negative numbers not allowed #{negative_numbers.join(",")}" if negative_numbers.any?
  end
end
  