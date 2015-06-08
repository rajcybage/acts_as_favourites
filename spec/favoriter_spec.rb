require 'spec_helper'

describe User do

	let(:charlie) { User.create(name: "Charlie") }
	let(:test) { Post.create(name: "test post") }
	
	
	describe "instance methods" do
		it "should be defined" do
			expect(charlie).to respond_to(:favorite)
			expect(charlie).to respond_to(:unfavorite)
			expect(charlie).to respond_to(:favorite?)
		end
	end

	describe "Association" do
		it "should have many favoritess" do
			association = User.reflect_on_association(:favorites)
			expect(association.macro).to eq :has_many
		end

		it "should have many favorites with dependent destroy" do
			association = User.reflect_on_association(:favorites)
			expect(association.options).to include :dependent => :destroy
		end
	end

	describe "#favorite?" do
		context "when user has favorable" do
			it "should return true" do
				create_favorite(charlie, test)
				expect(charlie.favorite?(test)).to be true
			end
		end

		context "when user has not favorited favorable" do
			it "should return false" do
				expect(charlie.favorite?(test)).to be false
			end
		end
	end

	describe "#favorite" do
		context "when user hasn't favorite favorable" do
			it "should create a favorite record" do
				expect {
					charlie.favorite(test)
				}.to change(Favorite, :count).by(1)
			end

			it "should set association of the favorite record" do
				charlie.favorite(test)
				fav = Favorite.find_by(favorable_id: test.id, favorable_type: test.class.base_class.name, favoriter_id: charlie.id)
				expect(fav.favoriter).to eq charlie
				expect(fav.favorable).to eq test
			end
		end

		context "when user has favorited post already" do
			it "should do nothing" do
				create_favorite(charlie, test)
				expect { 
					charlie.favorite(test)
				}.to change(Favorite, :count).by(0)
			end
		end
	end

	describe "#unfavorite" do
		context "when user has not favorite post " do
			it "should destroy the favorite record" do
				create_favorite(charlie, test)
				expect {
					charlie.unfavorite(test)
				}.to change(Favorite, :count).by(-1)
			end
		end

		context "when user has not favored post" do
			it "should do nothing" do
				expect {
					charlie.unfavorite(test)
				}.to change(Favorite, :count).by(0)
			end
		end
	end
end