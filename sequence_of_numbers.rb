class BaseError < StandardError
end

class SequenceNumbers
  def self.generate(step)
    raise BaseError, "Step must be more than 0" if step <= 0

    result = [1]

    return puts result if step == 1

    step.times do
      result << transcription_of_number(result.last)
    end

    puts result
  end

  private

  def self.transcription_of_number(number)
    result = []
    temp = []
    counter = 1
    row = number.inspect.scan(/./)

    row.each_with_index do |item, index|
      next result_picker(result, [item], 1) if row.size == 1

      next temp << item if temp == []

      break generate_last_number(item, result, temp, counter) if (row.size - 1) == index

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
end
