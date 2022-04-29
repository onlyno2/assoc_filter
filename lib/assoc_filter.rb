# frozen_string_literal: true

require 'active_support/concern'
require 'assoc_filter/version'

module AssocFilter
  autoload :Base, 'assoc_filter/base'
  autoload :MongoidSupport, 'assoc_filter/mongoid'
  autoload :FilterMap, 'assoc_filter/filter_map'

  def self.include(base)
    extended(base)
  end

  def self.extended(base)
    base.send(:extend, ActiveSupport::Concern)
    base.send(:extend, AssocFilter::Base)
  end
end
