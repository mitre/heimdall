require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'Profile imported' do
    before do
      profile_hash, controls = Profile.transform(JSON.parse(File.open("spec/support/nginx_profile.json", "r").read))
      @profile = Profile.new(profile_hash)
      controls.each do |control|
        @profile.controls.new(control)
      end
    end

    it "get is_editable?" do
      expect(@profile.is_editable?).to eq true
    end

    it "get control_families" do
      families, nist = @profile.control_families
      expect(families).to_not be_empty
      expect(nist).to have_key("AC-2")
      expect(nist).to have_key("AC-3")
    end

    it "get by_nist_family" do
      nist = @profile.by_nist_family
      expect(nist).to_not be_empty
    end

    it "get nist_hash" do
      nist = @profile.nist_hash nil
      expect(nist).to_not be_empty
      expect(nist).to have_key("CM-6")
    end

  end
end
