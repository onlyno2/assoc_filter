# frozen_string_literal: true

module AssocFilter
  class FilterMap
    attr_reader :filters

    def initialize
      @filters = []
    end

    def <<(filter)
      @filters << filter
    end

    def each
      @filters.each do |filter|
        yield filter
      end
    end

    def empty?
      @filters.empty?
    end
  end
end
