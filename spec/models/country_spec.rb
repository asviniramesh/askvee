require 'spec_helper'

describe Country do
	 it { should have_many(:states)}
	 it { should have_many(:users)}
 end