class ThingsController < InheritedResources::Base
  respond_to :html, :json

protected

  def collection
    @things ||= begin
			chain = end_of_association_chain
			nested_keys = []

			request.query_parameters.each do |key, value|
				chain = chain.where(key => params[key])
			end

			chain
		end
  end
end
