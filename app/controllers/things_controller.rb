class ThingsController < InheritedResources::Base
  respond_to :html, :json

protected

  def collection
    @things ||= begin
			chain = end_of_association_chain
			chain = chain.where(tags: params[:tags]) if params.has_key?(:tags)
			chain = chain.where(name: params[:name]) if params.has_key?(:name)
			chain
		end
  end
end
