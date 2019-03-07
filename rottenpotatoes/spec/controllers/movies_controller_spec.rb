require 'spec_helper'

describe MoviesController do
	describe 'find movies with same director' do
		it 'should call the model method that finds movies with same director' do
            expect(Movie).to 
                receive(:find)
        end
    end
end    
