class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to(root_url, {:flash => { :error => exception.message }})
    end
    
end
