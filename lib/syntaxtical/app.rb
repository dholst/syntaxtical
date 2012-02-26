module Syntaxtical
  class App < Sinatra::Base
    LANGUAGES = %w{
      bash
      c
      c#
      c++
      clojure
      coffeescript
      css
      erb
      erlang
      gherkin
      groovy
      haml
      haskell
      html
      irb
      java
      javascript
      json
      objective-c
      perl
      php
      python
      ruby
      sass
      scala
      xml
    }

    configure do
      set :public_folder, "#{File.dirname(__FILE__)}/../../public"
    end

    get "/" do
      erb :index
    end

    post "/" do
      @code = params[:code]
      @language = params[:language]
      @html = Pygments.highlight(@code, :lexer => @language, :options => {:noclasses => false})
      @inlined = Pygments.highlight(@code, :lexer => @language, :options => {:noclasses => true})
      @css = Pygments.css unless @inline

      request.accept.each do |type|
        if type.eql? "application/json"
          content_type :json
          halt ({:css => @css, :html => @html, :inlined => @inlined}.to_json)
        end
      end

      erb :index
    end
  end
end
