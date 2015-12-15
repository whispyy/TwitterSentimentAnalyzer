$:.unshift(File.dirname(__FILE__) + '/')

require 'distance_measures/euclidean_distance'
require 'distance_measures/core'

class Array
  include DistanceMeasures

  # http://en.wikipedia.org/wiki/Intersection_(set_theory)
  def intersection_with(other)
    (self & other)
  end

  # http://en.wikipedia.org/wiki/Union_(set_theory)
  def union_with(other)
    (self + other).uniq
  end

  private

  # Checks if we're dealing with NaN's and will return 0.0 unless
  # handle NaN's is set to false
  def handle_nan(result)
    result.nan? ? 0.0 : result
  end
end