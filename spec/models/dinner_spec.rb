require 'spec_helper'

describe Dinner do
		it { should belong_to(:user) }
		it { should have_many(:attachments) }

	end