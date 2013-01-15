require 'spec_helper'

describe TourGuide do
		it { should belong_to(:user) }
		it { should have_many(:attachments) }

	end