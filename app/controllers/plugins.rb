Sebastian::App.controllers :plugins do

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end

  get :index do

  end

  get :show, map: "/plugins/:name", provides: [:html, :svg] do
    render :show
  end

  before :show do
    @plugin = Plugin.find_by(name: params[:name])
  end

end
