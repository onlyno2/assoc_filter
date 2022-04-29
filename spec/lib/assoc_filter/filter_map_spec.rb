# frozen_string_literal: true

RSpec.describe(AssocFilter::FilterMap) do
  subject(:filter_map) { described_class.new }

  it 'empty when no filter' do
    expect(filter_map.filters).to be_empty
  end

  it 'not empty when filter added' do
    filter_map.filters << 'filter'
    expect(filter_map.filters).not_to be_empty
  end

  it 'iterates over all filters' do
    filter_map.filters << 'filter1'
    filter_map.filters << 'filter2'
    actual = []

    filter_map.each do |filter|
      actual << filter
    end

    expect(actual).to eq(%w[filter1 filter2])
  end
end
