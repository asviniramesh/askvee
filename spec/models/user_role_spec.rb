require 'spec_helper'

describe UserRole do
		it { should belong_to(:user) }
		it { should belong_to(:role) }

	end