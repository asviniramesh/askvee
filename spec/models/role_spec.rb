require 'spec_helper'

describe Role do
		it { should have_many(:user_roles)}
		it { should have_many(:users).through(:user_roles) }
	end