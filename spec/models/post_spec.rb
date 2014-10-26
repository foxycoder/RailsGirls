require 'spec_helper'

describe Post do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to accept_nested_attributes_for :comments }
end
