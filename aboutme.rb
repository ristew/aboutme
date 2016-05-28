Camping.goes :AboutMe

module AboutMe::Models
    class Page < Base
    end
end

module AboutMe::Controllers
    class StaticServer < R '/static/([^/]+)[\.](.+)'
        def get(file_name, ext)
            if ext == "css"
                @headers['Content-Type'] = 'text/css; charset=utf-8'
            end
            File::open("static/#{file_name}.#{ext}").read
        end
    end
    class Index < R '/'
        def get
            render :index
        end
    end
end

module AboutMe::Views
    def layout
        html do
            head do
                title {"the personal homepage of riley stewart"}
                script :src => "static/logic.js"
                link :rel => 'stylesheet', :type => 'text/css', 
                    :href => '/static/style.css'
            end
            body { self << yield }
        end
    end

    def index
        h3 "use w, a, s, d to navigate"
        a "home", :href => '#', :id => "wlink", :class => "selector"
        br
        a "about", :href => '#a', :id => "alink", :class => "selector"
        a "github", :href => 'https://github.com/ristew', :id => "dlink", :class => "selector"
        br
        a "contact", :href => '#s', :id => "slink", :class => "selector"
    end
end

def AboutMe.create
end
