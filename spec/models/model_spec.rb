require 'rails_helper'

RSpec.describe Model, type: :model do
  context "I have a model on initial state" do
    let(:model) { Model.new }

    it "is on state 'step_0'" do
      expect(model.current_step_name).to eq(0)
    end

    it "can't go to any state if not valid" do
      5.times do |i|
        expect { model.send("goto_step_#{i+1}!") }.to raise_error StateMachines::InvalidTransition
      end
    end

    context "it transits to the second state" do
      it "cannot if invalid" do
        expect { model.goto_step_1! }.to raise_error StateMachines::InvalidTransition
      end

      it "can if valid" do
        5.times do |j|
          model.send("field_0_#{j}=", 'test')
        end
        model.goto_step_1!
        expect(model.current_step_name).to eq(1)
      end
    end

  end
end
