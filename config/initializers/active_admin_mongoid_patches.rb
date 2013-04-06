require "active_admin"
require "active_admin/resource_controller"

module ActiveAdmin
  class Namespace
    # Disable comments
    def comments?
      false
    end
  end

  class Resource
    def resource_table_name
      resource.collection_name
    end

    # Disable filters
    def add_default_sidebar_sections
    end
  end

  class ResourceController < BaseController
    # Use #desc and #asc for sorting.
    def sort_order(chain)
      params[:order] ||= active_admin_config.sort_order
      table_name = active_admin_config.resource_table_name
      if params[:order] && params[:order] =~ /^([\w\_\.]+)_(desc|asc)$/
        chain.send($2, $1)
      else
        chain # just return the chain
      end
    end

    # Disable filters
    def search(chain)
      chain
    end
  end
end
