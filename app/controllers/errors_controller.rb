class ErrorsController < ApplicationController
    def not_found
      render template: 'errors/404', status: 404
    end
  
    def internal_server_error
      render template: 'errors/500', status: 500
    end
  end
  