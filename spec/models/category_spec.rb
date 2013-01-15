require 'spec_helper'

describe Category do

   it { should have_many(:user_categories)}
   it { should have_many(:users), :through => :user_categories}
   it { should have_many(:rooms)}
end
