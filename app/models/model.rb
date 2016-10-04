class Model < ApplicationRecord

  state_machine :current_step, initial: 0 do
    before_transition any => any do |model|
      model.validate_current_step
    end

    6.times do |i|
      state i do
        define_method(:validate_current_step) do
          5.times do |j|
            self.class.validates_presence_of "field_#{i}_#{j}".to_sym
          end
          valid?
        end
      end
    end

    5.times do |i|
      event "goto_step_#{i+1}" do
        transition i => i+1
      end
    end
  end
end
