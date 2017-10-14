module GrapeDoc
  class APIDocument
    attr_accessor :resource_name, 
                  :path, 
                  :description, 
                  :params,
                  :response, 
                  :http_method, 
                  :empty
    def initialize(resource = nil, route = nil)
      return if route.nil?
      if route.path == "/:version/(.:format)"
        self.empty = true
        return
      end
      self.path = route.path.gsub('(.:format)','')
      self.resource_name = resource
      self.http_method = route.request_method
      self.description = route.description
      self.params = APIParameter.initialize_parameters route.params
      #self.response = nil_or_empty route.route_response
    end

    private 
    def nil_or_empty(hash)
      if hash
        return hash.empty? ? nil : hash
      end
      hash
    end
  end
end

