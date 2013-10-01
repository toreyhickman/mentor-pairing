require 'spec_helper'

describe Kudo do
  it { should belong_to(:appointment) }
  it { should belong_to(:mentor) }
  it { should belong_to(:mentee) }

  describe '#create' do
    let(:mentor) { FactoryGirl.create(:mentor) }
    let(:mentee) { FactoryGirl.create(:mentee) }
    let(:create_kudo) { Kudo.create(mentor: mentor, mentee: mentee, appointment_id: 1) }

    it 'should have a default point value' do
      create_kudo
      expect(Kudo.first.points).to eq(5)
    end

    it 'should increment the mentors total_kudos' do
      expect{ create_kudo }.to change{ mentor.total_kudos }.by(5)
    end

    it 'should increment the mentees total_given_kudos' do
      expect{ create_kudo }.to change{ mentee.total_given_kudos }.by(5)
    end
  end
end
