class Skynet::Stats
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum
    @array.inject(0.0) { |result, el| result + el }
  end

  def count
    @array.count
  end

  def mean
    sum / count
  end

  def mode
    frequency_table = @array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @array.max_by { |v| frequency_table[v] }
  end

  def median
    sorted = @array.sort
    length = @array.length
    (sorted[(length-1)/2] + sorted[length / 2]) / 2.0
  end

  def differences
    # Returns an array of each elements difference from the mean
    @array.map {|e| e - mean }
  end

  def variance
    squared_differences = differences.map{ |e| e ** 2 }
    squared_sum = squared_differences.inject(0.0) { |result, e| result + e }
    squared_sum / count
  end

  def standard_deviation
    Math.sqrt(variance)
  end

  def outliers
    # Returns an array of datapoints more than one standard deviation from the mean
    positive_deviation = standard_deviation + mean
    negative_deviation = -positive_deviation
    @array.delete_if { |e| (negative_deviation..positive_deviation).include?(e) }
  end
end
