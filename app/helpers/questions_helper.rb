module QuestionsHelper
  class Quote
    include HTTParty
    def initialize
      @response = HTTParty.get('https://api.github.com/zen', :headers => {
                "User-Agent" => "kiopelani"
                })
    end

    def get_quote
      @quote = @response.body
    end

  end
end
