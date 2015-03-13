require 'spec_helper'


describe SurveyTemplatesController do
  describe "displaying a survey" do
    before (:each) do
      @st = SurveyTemplate.create
    end
    it 'renders SurveyTemplate#show' do
      get :show, :id => @st.id
      expect(response).to render_template("show")	
    end
    it 'looks for the template\'s survey fields' do
      SurveyTemplate.should_receive(:find).with(@st.id.to_s).and_return(@st)  
      get :show, :id => @st.id
    end
  end
  describe "displaying all forms" do
    it 'shows the available templates' do
      get :index
      expect(response).to render_template("index")
    end
  end
end

