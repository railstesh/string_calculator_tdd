class StringCalculator
    def add(string)
      return 0 if string.empty?
  
      return "Invalid Input" if invalid_input?(string)
  
      numbers = extract_numbers(string)
      negative_numbers = negative_numbers?(numbers)
      raise negative_error(negative_numbers) unless negative_numbers.empty?
  
      numbers.sum
    end
  
    private
  
    def invalid_input?(string)
      string.match(/,\n\z/)
    end
  
    def extract_numbers(string)
      separators = [",", "\n"]
      separators << string.split("\n")[0][2..-1] if includes_delimiter?(string)
      string.split(/#{Regexp.union(separators)}/).map(&:to_i)
    end
  
    def includes_delimiter?(string)
      string.start_with?("//")
    end
  
    def negative_numbers?(numbers)
      numbers.select{ |n| n if n.negative? }
    end
  
    def negative_error(numbers)
      "negative numbers not allowed #{numbers.join(",")}"
    end
  end
  