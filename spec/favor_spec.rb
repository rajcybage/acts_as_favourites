require 'spec_helper'

describe Post, focus: true do
  let(:charlie) { User.create(name: "Charlie") }
  let(:test_post) { Post.create(name: "test_post") }
  
  describe "Association" do
    it "should have many favorites" do
      association = Post.reflect_on_association(:favorites)
      expect(association.macro).to eq :has_many
    end

    it "should have many favorites with dependent destroy" do
      association = Post.reflect_on_association(:favorites)
      expect(association.options).to include :dependent => :destroy
    end
  end

  describe "#favorites_count" do
    it "should count favorites" do
      create_favorite(charlie, test_post)
      expect(test_post.favorites_count).to eq 1
    end
  end

  describe "#favorite_by?" 
  context "when user has favored post" do
    it "should return true" do
      create_favorite(charlie, test_post)
      puts test_post.favorites.where(favoriter_id: charlie.id)
      expect(test_post.favorite_by?(charlie)).to be true
    end
   end

  context "when user hasn't favored post" do
    it "should return false" do
      expect(test_post.favorite_by?(charlie)).to be false
    end
  end
 end

  describe "#favorite_by" do
  context "when user has not favorite post" do
    it "should create Favorite" do
      expect{
      test_post.favorite_by(charlie)
      }.to change(Favorite, :count).by(1)
    end

    it "should set Favorite to belong to favoriter" do
      test_post.favorite_by(charlie)
      fav = Favorite.find_by(favorable_id: test_post.id, favorable_type: test_post.class.base_class.name, favoriter_id: charlie.id, favoriter_type: charlie.class.base_class.name)
      expect(fav.favoriter).to eq charlie
    end

    it "should set  to belong to favor" do
      test_post.favorite_by(charlie)
      fav = Favorite.find_by(favorable_id: test_post.id, favorable_type: test_post.class.base_class.name, favoriter_id: charlie.id, favoriter_type: charlie.class.base_class.name)
      expect(fav.favorable).to eq test_post				
    end
  end
end
end
