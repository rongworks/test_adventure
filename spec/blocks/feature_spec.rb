require 'rspec'
#require 'spec_helper'
RSpec.describe Feature do

  let(:feature){Feature.new('feature','F1')}
  it 'should have scenarios' do
    expect(feature.scenarios).to be_empty
  end
end