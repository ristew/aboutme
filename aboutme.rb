Camping.goes :AboutMe

module AboutMe::Models
end

module AboutMe::Controllers
    class StaticServer < R '/static/([^/]+)[\.](.+)'
        def get(file_name, ext)
            if ext == "css"
                @headers['Content-Type'] = 'text/css; charset=utf-8'
            end
            File::open("static/#{file_name}.#{ext}").read rescue r(404, "file not found")
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
                meta :charset => "utf-8"
                meta :name => "viewport", 
                    :content => "width=device-width, initial-scale=1"
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
        a "home (w)", :href => '#', :class => "selector-w"
        br
        a "about (a)", :href => '/about', :class => "selector-a"
        a "github (d)", :href => 'https://github.com/ristew', 
            :class => "selector-d"
        br
        a "contact (s)", :href => 'mailto:riley.a.stewart at vanderbilt.edu', 
            :class => "selector-s"
        br
        h3 "Riley Stewart 2016"
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
        a "home (w)", :href => '/#', :class => "selector-w"
    end
end
