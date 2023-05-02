class ApplicationController < ActionController::Base
    include SessionsHelper
    protect_from_forgery
    before_action :set_search

    def set_search
        @q_home = Room.ransack(params[:q])
    end
end
