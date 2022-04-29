# frozen_string_literal: true

module AssocFilter
  module Base
    def self.extended(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
      def register_filters(*args)
        args.each do |arg|
          raise(InvalidFilter) unless arg.respond_to?(:to_s)

          filters << arg.to_s
        end

        filters.each do |filter|
          method_name = "filter_by_#{filter}"
          define_singleton_method(method_name.to_sym) do |value|
            where(filter.to_sym => value)
          end
        end
      end

      def filter_by(conditions)
        conditions.inject(self) do |relation, (filter_type, args)|
          relation.send("filter_by_#{filter_type}", args)
        end
      end

      private

      def filters
        @filters ||= FilterMap.new
      end
    end
  end
end
