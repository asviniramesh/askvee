require 'spec_helper'

describe State do
		it { should have_many(:cities)}
		it { should have_many(:users).class_name('User')}
		it { should belong_to(:country) }
	end