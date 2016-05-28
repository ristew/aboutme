Camping.goes :AboutMe

module AboutMe::Models
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
    class About < R '/about'
        def get
            render :about
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
        a "home (w)", :href => '#', :id => "wlink", :class => "selector"
        br
        a "about (a)", :href => '/about', :id => "alink", :class => "selector"
        a "github (d)", :href => 'https://github.com/ristew', :id => "dlink", :class => "selector"
        br
        a "contact (s)", :href => 'mailto:riley.a.stewart@vanderbilt.edu', :id => "slink", :class => "selector"
    end

    def about
        h3 "who I am"
        ["Riley Stewart",
         "rising senior at vanderbilt",
         "hacker and inventor"].each do |item|
                li item
        end
        h3 "the things I enjoy:"
        ["coffee", "python",
        "ruby (this site is built with it)",
        "rust", "REST", "javascript",
        "making something work",
        "making something work well"].each do |item|
                li item
        end

        h3 "what I've done"
        ["a RESTy api in j2ee (ugh)",
        "a song generator",
        "too many brainf*ck interpreters"].each do |item|
                li item
        end

        li do
            span "everything else at "
            a "my github", :href => "https://github.com/ristew"
        end
        a "home (w)", :href => '/#', :id => "wlink", :class => "selector"
    end
end
