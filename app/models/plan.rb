class Plan < ActiveRecord::Base
	has_many :subscriptions
	attr_accessor :count
end
