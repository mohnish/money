require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe UsersHelper do
  describe '#get_initials' do
    it 'returns the initials of a given name' do
      expect(helper.get_initials("Mohnish Thallavajula")).to eql("MT")
      expect(helper.get_initials("david heinemeier hansson")).to eql("DHH")
      expect(helper.get_initials("james o'reilly")).to eql("JO")
    end
  end
end
