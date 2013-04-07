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
        if key.to_s =~ /\./ && Tag.key_type(key.to_s) == 'boolean'
          chain = chain.all(key => value == 'true')
        else
          chain = chain.all(key => value.split(',')) unless key.to_s == 'jsonpCallback'
        end
      end

      chain
    end
  end
end
