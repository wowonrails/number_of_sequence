require "minitest/autorun"
require "minitest/spec"
require_relative "sequence_of_numbers"

describe SequenceOfNumbers do
  let(:sequence_of_numbers_in_6_steps) { [1, 11, 21, 1211, 111221, 312211] }

  describe ".generate" do
    it "returns an answer" do
      sequence_of_numbers_in_6_steps.size.times do |i|
        sequence_of_numbers = SequenceOfNumbers.generate(i+1)

        sequence_of_numbers[i].must_equal sequence_of_numbers_in_6_steps[i]
      end
    end

    it "returns an errors" do
      Proc.new{ SequenceOfNumbers.generate(-1) }.must_raise Error
      Proc.new{ SequenceOfNumbers.generate(0) }.must_raise "Arguments must be greater than zero"
      Proc.new{ SequenceOfNumbers.generate(1.0) }.must_raise "Arguments must be integers"
    end
  end
end
