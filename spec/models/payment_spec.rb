require 'spec_helper'

describe Payment do

  it { should belong_to(:room_booking) }

end
