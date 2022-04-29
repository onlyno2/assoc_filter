# frozen_string_literal: true

class DummyModel
  extend AssocFilter
end

RSpec.describe(AssocFilter::Base) do
  describe '#register_filters' do
    it 'can register filters' do
      expect(DummyModel.respond_to?(:register_filters)).to be(true)
    end

    it 'generate default filter methods' do
      DummyModel.register_filters(:name, :active)
      expect(DummyModel.respond_to?(:filter_by_name)).to be(true)
      expect(DummyModel.respond_to?(:filter_by_active)).to be(true)
    end
  end

  describe '#filter_by' do
    let(:filter_params) do
      {
        'name' => 'some_name'
      }
    end

    it 'can be filter by registered filter' do
      DummyModel.register_filters(:name)
      expect(DummyModel).to receive(:filter_by_name)
      DummyModel.filter_by(filter_params)
    end
  end
end
