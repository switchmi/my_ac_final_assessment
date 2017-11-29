require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) {create(:user)}
  let(:note) {create(:note, user: user)}
  let(:subject) {create(:like, user: user, note: note)}

  # it {is_expected.to validate_presence_of(:user_id)}
  # it {is_expected.to validate_presence_of(:note_id)}
end
