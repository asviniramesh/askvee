require 'spec_helper'

describe Accommodation do
		it { should belong_to(:user) }
                it { should belong_to(:category) }
                it { should belong_to(:property) } 
                it { should have_many(:green_profiles), :through => :applicants}

                 
	end

