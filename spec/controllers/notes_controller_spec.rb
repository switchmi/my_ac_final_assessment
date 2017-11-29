require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let!(:user) {create(:user)}
  before {sign_in user}

  describe 'GET #edit' do
    let(:note_1) {create(:note, user: user)}
    before {get :edit, params: {id: note_1}}
    it {expect(assigns(:note)).to eq(note_1)}
  end

  describe 'POST #create' do
    let(:user_1) {create(:user)}
    before {
      post :create,
      params: {note: note_attributes}
    }

    context 'when save passes' do
      let(:note_attributes) {attributes_for(:note)}
      let(:note_1) {create(:note, user: user_1)}

      it {expect(Note.count).to eq(1)}
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'when save does not pass' do
      let(:note_attributes) {attributes_for(:note, title: nil)}
      it {expect(subject).to redirect_to(root_path)}
    end
  end

  describe 'PUT #update' do
    let(:user_1) {create(:user)}
    let(:note_1) {create(:note, user: user_1)}
    before {
      put :update,
      params: {id: note_1, note: note_attributes}
    }

    context 'when save passes' do
      let(:note_attributes) {attributes_for(:note)}
      it {expect(subject).to redirect_to(root_path)}
    end

    context 'when save does not pass' do
      let(:note_attributes) {attributes_for(:note, title: nil)}
      it {expect(subject).to render_template(:edit)}
    end
  end

  describe 'DELETE #destroy' do
    let(:note_1) {create(:note)}

    before do
      delete :destroy,
      params: {
        id: note_1
      }
    end

    it {expect(assigns(:note)).to be_destroyed}
    it {expect(subject).to redirect_to(root_path)}
  end



end
