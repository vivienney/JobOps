require 'spec_helper'

describe JobHistoriesController do
  
  login_user
  
  before(:each) do
    @user = Factory(:user)
  end
  
  describe "#show" do
    before do
      post :create, :job_history => Factory.attributes_for(:job_history)
    end
    
    it "should render the show template" do
      @job_histories = JobHistory.find(:first)
      get :show, :id => @job_histories
      response.should render_template("job_histories/show")
    end
  end
  
  describe '#create' do
    before do
      post :create, :job_history => Factory.attributes_for(:job_history)
      @job_histories = JobHistory.find(:first)
      @response = response
    end
    
    it "should create a job" do
      JobHistory.all.size.should == 1
    end
    
    it "should redirect to that job" do
      @response.should redirect_to(@job_histories)
    end
  end
  
  describe '#update' do
    before do
      @job_history = Factory(:job_history)
      put :update, :id => @job_history.id, :job_history => { :org_name => "Pandas R Us" }
    end

    it "should update the organization name" do
      @job_history.reload.org_name.should == "Pandas R Us"
    end
  end
  
  describe '#destroy' do
    before do
      @job_history = Factory(:job_history)
      @job_history_count = JobHistory.all.size
      delete :destroy, :id => @job_history.id
    end

    it "should destroy a job history" do
      JobHistory.all.size.should == @job_history_count - 1
      expect{@job_history.reload}.to raise_error ActiveRecord::RecordNotFound
    end
  end  
end