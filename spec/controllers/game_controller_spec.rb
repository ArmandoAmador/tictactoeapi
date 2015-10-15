require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @game = FactoryGirl.create :game
      get :show, id: @game.id, format: :json
    end

    it 'returns the information about a game on a hash' do
      game_response = json_response
      expect(game_response[:status]).to eql @game.status
    end

    it { is_expected.to respond_with 200 }
  end

  describe 'POST #create' do
    context 'when is not created' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @game_attributes = {
          player_2: @user.id
        }
        post :create, game: @game_attributes, format: :json
      end

      it 'renders an error json' do
        game_response = json_response
        expect(game_response).to have_key(:errors)
      end

      it 'renders the json errors on why the game creation was unsuccessful' do
        game_response = json_response
        expect(game_response[:errors][:player_1]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end

    context 'when it is successfully created' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        @game_attributes = {
          player_1_id: @user.id
        }
        post :create, game: @game_attributes, format: :json
      end

      it 'renders the json response for the game record just created' do
        game_response = json_response
        expect(game_response[:status]).to eql "Game in Progress"
      end

      it { is_expected.to respond_with 201 }
    end
  end
end
