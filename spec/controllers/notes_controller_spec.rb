require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let!(:user) {create(:user)}
  before {sign_in user}

  describe 'POST #create' do
    let!(:user_1) {create(:user)}
    before {
      post :create,
      params: note_attributes
    }
    
    context 'when save passes' do
      let!(:note_attributes) {attributes_for(:note)}
      let!(:note_1) {create(:note, user: user_1)}

      it {expect(Note.count).to eq(1)}
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'when save does not pass' do
      let!(:note_attributes) {attributes_for(:note, title: nil)}
      it {expect(subject).to redirect_to(root_path)}
    end
  end
end
