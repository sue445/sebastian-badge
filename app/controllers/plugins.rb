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

  register Padrino::Cache
  enable :caching

  get :index do
    if params[:query].present?
      conditions = search(params[:query])
    else
      conditions = Plugin.all
    end
    @plugins = conditions.order(released_at: :desc).page(params[:page])

    render :index
  end

  get :show, map: "/plugins/:name", provides: [:html, :svg], cache: settings.enabled_paging_cache? do
    if settings.enabled_paging_cache?
      expires  1.day.to_i
    end

    render "show.#{content_type}"
  end

  before :show do
    @plugin = Plugin.find_by(name: params[:name])
    @title = @plugin.title
  end

  helpers do
    def search(query)
      groonga_plugins = Groonga["Plugins"]
      matched_groonga_plugins = groonga_plugins.select do |record|
        record.match(query) do |match_target|
          match_target.title | match_target.name
        end
      end
      plugin_ids = matched_groonga_plugins.map(&:_key)
      Plugin.where(id: plugin_ids)
    end
  end
end
