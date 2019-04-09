require 'rspec'
require 'spec_helper'

RSpec.describe 'Feature' do

  let(:feature){Feature.new('feature','F1')}
  it 'should have scenarios' do
    expect(feature.scenarios).to be_empty
  end

  it 'can create a scenario' do
    test_block = <<-STR
      scenario 'test' do
        is_given 'a string'
      end
    STR

    feature.instance_eval test_block
    expect(feature.scenarios.size).to eq(1)
    expect(feature.scenarios.first.name).to eq('test')
  end

  it 'will pass helper methods to scenarios' do
    pending('Not iplemented')
    test_block = <<-STR
      def test
        'foo'
      end

      scenario 'test' do
        is_given 'a string'
      end
    STR

    feature.instance_eval test_block
    expect(feature.scenarios.first.test).to eq('foo')
  end
end