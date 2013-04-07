class ThingsController < InheritedResources::Base
  respond_to :html, :json

  def index
    index! callback: params[:jsonpCallback]
  end

protected

  def collection
    @things ||= begin
      chain = end_of_association_chain

      request.query_parameters.each do |key, value|
        chain = chain.all(key => value.split(',')) unless key.to_s == 'jsonpCallback'
      end

      chain
    end
  end
end
