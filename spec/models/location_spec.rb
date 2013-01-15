require 'spec_helper'

describe Location do
		it { should belong_to(:city) }
		it { should have_many(:users).class_name('User')}
	end