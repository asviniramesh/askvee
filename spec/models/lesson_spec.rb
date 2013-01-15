require 'spec_helper'

describe BreakFast do
		it { should belong_to(:user) }
		it { should have_many(:attachments) }

	end