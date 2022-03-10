class HomeController < ApplicationController
    def index
        @experiences = Experience.order(created_at: :desc).limit(5)
    end
end
