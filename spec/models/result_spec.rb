require 'rails_helper'

RSpec.describe Result, type: :model do
  context 'Result built' do
    let(:result) { FactoryBot.build(:result) }

    it 'get profile_error status_symbol' do
      expect(result.status_symbol).to eq :profile_error
    end

    it 'get open status_symbol' do
      result.status = 'failed'
      expect(result.status_symbol).to eq :failed
    end

    it 'get passed status_symbol' do
      result.status = 'passed'
      expect(result.status_symbol).to eq :passed
    end

    it 'get skipped status_symbol' do
      result.status = 'skipped'
      expect(result.status_symbol).to eq :not_reviewed
    end

    it 'get build json string' do
      expect(result.to_json).to be_a(String)
      expect(JSON.parse(result.to_json)).to have_key('status')
    end

    it 'get build json' do
      expect(result.as_json).to have_key('status')
    end

  end
end
