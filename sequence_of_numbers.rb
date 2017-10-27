class Error < RuntimeError
end

class SequenceOfNumbers
  def self.generate(step, number = 1)
    arguments_validator(step, number)

    result = [number]

    return result if step == 1

    step.times do
      result << transcription_of_number(result.last)
    end

    result
  end

  private

  def self.transcription_of_number(number)
    result = []
    temp = []
    counter = 1
    array_of_chars = number.to_s.chars

    array_of_chars.each_with_index do |item, index|
      break result_picker(result, array_of_chars, 1) if array_of_chars.size == 1

      next temp << item if temp.empty?

      break generate_last_number(item, result, temp, counter) if (array_of_chars.size - 1) == index

      next counter += 1 if temp.last == item

      result_picker(result, temp, counter)
      temp = [item]
      counter = 1
    end

    result.join.to_i
  end

  def self.result_picker(result, temp, counter)
    result << temp.push(counter).reverse.join
  end

  def self.generate_last_number(item, result, temp, counter)
    if temp.last == item
      counter += 1
      result_picker(result, temp, counter)
    else
      result_picker(result, temp, counter)

      result_picker(result, [item], 1)
    end
  end

  def self.arguments_validator(step, number)
    raise Error, "Arguments must be greater than zero" if step <= 0 || number <= 0

    raise Error, "Arguments must be integers" if not step.integer? or not number.integer?
  end
end
