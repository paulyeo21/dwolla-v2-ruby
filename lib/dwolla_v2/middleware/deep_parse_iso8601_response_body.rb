module DwollaV2
  class DeepParseIso8601ResponseBody
    def initialize app
      @app = app
    end

    def call request_env
      @app.call(request_env).on_complete do |response_env|
        response_env.body = Util.deep_parse_iso8601_values(response_env.body)
      end
    end
  end
end
