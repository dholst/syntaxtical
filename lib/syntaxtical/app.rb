module Syntaxtical
  class App < Sinatra::Base
    LANGUAGES = [
      :javascript,
      :ruby
    ]

    configure do
      RubyPython.configure :python_exe => 'python2.6'
      set :public_folder, "#{File.dirname(__FILE__)}/../../public"
    end

    get "/" do
      erb :index
    end

    post "/" do
      @code = params[:code]
      @language = params[:language]
      @inline = !!params[:inline]
      @html = Pygments.highlight(@code, :lexer => @language, :options => {:noclasses => @inline})
      @css = Pygments.css unless @inline

      request.accept.each do |type|
        if type.eql? "application/json"
          content_type :json
          halt ({:css => @css, :html => @html}.to_json)
        end
      end

      erb :index
    end
  end
end
