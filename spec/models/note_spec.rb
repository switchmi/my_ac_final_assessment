require 'rails_helper'

RSpec.describe Note, type: :model do

  let(:user) {create(:user)}
  let(:subject) {create(:note, user: user)}

  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_presence_of(:body)}
end
