require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe "relationships" do
    it {should have_many :actor_movies}
    it {should have_many(:movies).through(:actor_movies)}
  end
  describe "methods" do
    it "youngeset_to_oldest" do 

      actor1 = Actor.create!(name: "actor1", age: 1)
      actor2 = Actor.create!(name: "actor2", age: 2)
      actor3 = Actor.create!(name: "actor3", age: 3)
      actor4 = Actor.create!(name: "actor4", age: 4)

      actors = Actor.all

      expect(actors.youngest_to_oldest).to eq([actor1, actor2, actor3, actor4])
    end 
    it "average_age" do 

      actor1 = Actor.create!(name: "actor1", age: 6)
      actor2 = Actor.create!(name: "actor2", age: 2)

      actors = Actor.all

      expect(actors.average_age).to eq(4)
    end 
  end
end