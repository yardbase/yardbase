class ThingsController < InheritedResources::Base
  respond_to :html, :json

protected

  def collection
    @things ||= begin
			chain = end_of_association_chain
			request.query_parameters.each_key do |key|
				chain = chain.where(key => params[key])
			end
			chain
		end
  end
end
