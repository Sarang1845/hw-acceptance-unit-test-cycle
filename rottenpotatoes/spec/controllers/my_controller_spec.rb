require 'spec_helper'
#require 'movies_controller'

#describe MoviesController do
RSpec.describe MoviesController, :type => :controller do
	#describe 'find movies with same director' do
	#	it "renders similar movies page" do
    #        expect(response).to render_template
    #        get :with_same_director, {
    #    end
    #end
    #describe 'find movies with same director' do
   # before(:each) do
#        @temp = Movie.create(:title => "New Moon", :rating => "G", :director => "Sam Roth", :release_date => "10/10/1996")
#    end    
#		it 'should call appropriate model method that finds movies with same director' do
#		    expect(Movie).to receive(:movies_with_same_director).with("3")
 #           get :with_same_director, {:id => 3}
  #     end
   # end
    describe 'index controller action' do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end
    end
    describe 'Show action working?' do
        it "should call model method to find a movie based on particular id" do
           expect(Movie).to receive(:find).with("1")
           get :show, {:id => 1}
           expect(response).to render_template("show")
        end    
    end
    
    describe 'Edit action working?' do
        it "should call model method to find a movie based on particular id" do
           expect(Movie).to receive(:find).with("6")
           get :edit, {:id => 6}
           expect(response).to render_template("edit")
        end    
    end
    describe 'Check Create Action working or not' do
        it 'should create a movie and then check if it exists' do
            post :create, :movie => { :title => "Karate Kid", :rating => "G", :director => "Quentin Tarantino", :release_date => "10/10/1996" }
            expect(Movie.where(:director => "Quentin Tarantino")).to exist
            @tempmovie = Movie.find_by_title("Karate Kid")
            flash[:notice].should eq("#{@tempmovie.title} was successfully created.")
            response.should redirect_to movies_path
            
        end
    end
    
    describe 'Delete Action working or not' do
        it 'delete action should give appropriate flash message' do
            post :create, :movie => { :title => "The Kids Movie", :rating => "G", :director => "Ben Moss", :release_date => "10/10/1996" }
            expect(Movie.where(:director => "Ben Moss")).to exist
            @tempmovie = Movie.find_by_title("The Kids Movie")
            delete :destroy, :id => @tempmovie[:id]
            flash[:notice].should eq ("Movie '#{@tempmovie.title}' deleted.")
        end
        
        it 'delete action should redirect to list of movies' do
            post :create, :movie => { :title => "The Kids Movie", :rating => "G", :director => "Ben Moss", :release_date => "10/10/1996" }
            expect(Movie.where(:director => "Ben Moss")).to exist
            @tempmovie = Movie.find_by_title("The Kids Movie")
            delete :destroy, :id => @tempmovie[:id]
            flash[:notice].should eq ("Movie '#{@tempmovie.title}' deleted.")
            response.should redirect_to movies_path
        end
    end
    
    
    
end    
