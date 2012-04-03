module SyoboiCalendar
  module Agent
    extend self

    # These CONSTANTS will create method
    #   such as Agent.base, Agent.search, Agent.json
    BASE_URL   = "http://cal.syoboi.jp"
    SEARCH_URL = BASE_URL + "/find"
    JSON_URL   = BASE_URL + "/json.php"
    LOGIN_URL  = BASE_URL + "/usr"

    def login(args)
      page = get LOGIN_URL
      form = page.forms[1]
      form.usr  = args[:user]
      form.pass = args[:pass]
      agent.submit(form)
    end

    def json(query)
      page = get JSON_URL, query
      JSON.parse(page.content)
    end

    def search(query)
      get SEARCH_URL, query
    end

    private

    def get(url, hash = {})
      agent.get(url + querinize(hash))
    end

    # change hash into URL query string
    def querinize(hash)
      "?" + hash.map { |k, v| "#{k}=#{v}" }.join("&")
    end

    def agent
      @agent ||= Mechanize.new
    end
  end
end