require 'rails_helper'

describe Movie do

	describe 'searching TMDb by keyword' do

		context 'with valid API key' do
		
			it 'calls TMDb with title keywords' do
				expect(Tmdb::Movie).to receive(:find).with('Inception')
				Movie.find_in_tmdb('Inception')
			end

		end

		context 'with invalid API key' do

			before :each do
				allow(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
				allow(Tmdb::Api).to receive(:response).and_return('code' => 401)
			end
			
			it 'raises an InvalidKeyError with invalid API key' do
				expect(lambda { Movie.find_in_tmdb('Inception') }).to raise_error(Movie::InvalidKeyError)
			end

		end

	end

	it "includes rating and year in full name" do
		movie = FactoryGirl.build(:movie, :title => 'Milk', :rating => 'R')
		expect(movie.name_with_rating).to eq('Milk (R)')
	end
end