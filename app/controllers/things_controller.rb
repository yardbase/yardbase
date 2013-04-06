class ThingsController < InheritedResources::Base
  respond_to :html, :json

protected

  def collection
    @things ||= end_of_association_chain.where(tags: params[:tags])
  end
end
