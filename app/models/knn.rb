require 'distance_measures'

class KNN
  def initialize(data, options={})
    @data = data
    @distance_measure = options[:distance_measure] || :euclidean_distance
  end
  
  def nearest_neighbours(input, k=4)
    find_closest_data(input, k)
  end
  
  private
  
  def find_closest_data(input, k)
    begin
      calculated_distances = []
    
      @data.each_with_index do |datum, index| #Ye olde english
        distance = input.send(@distance_measure, datum)
        calculated_distances << [index, distance, datum]
      end
    
      calculated_distances.sort {|x, y| x[1] <=> y[1]}.first(k)
    rescue NoMethodError
      raise "Error!"
    end
  end  
end