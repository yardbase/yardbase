class ThingsController < InheritedResources::Base
  respond_to :html, :json

protected

  def collection
    @things ||= begin
			chain = end_of_association_chain

			request.query_parameters.each do |key, value|
        chain = chain.all(key => value.split(','))
			end

			chain
		end
  end
end
