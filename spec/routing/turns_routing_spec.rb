require 'spec_helper'

describe "Turns Routes" do
	let(:user) {User.create(name: "Dirty Harry", email: "email@email.com", password: "password")}
  let(:game_name) { "Catan" }
	let(:game_players_3) { 3 }

  before do
		@game = Game.create(:name => game_name, :number_of_players => game_players_3, :user_id => user.id)
		@turn = Turn.create(:result => 5, :game_id => @game.id)
  end

	describe "Edit page '/games/:id/turns/:id/edit'" do

		before do
			visit "/games/:id/turns/:id/edit"
		end

		it 'responds with a 200 status code' do
			expect(page.status_code).to eq(200)
		end

		it "displays a turn" do
			expect(page.body).to include(@turn.result)
		end
	end
		# it "displays a form to edit at turn" do
		# 	expect(page.body).to include(@turn.result)
		# end
end