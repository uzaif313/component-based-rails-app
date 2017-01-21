module News
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def curent_ability
      @current_ability ||= News::Ability.new(current_user)
    end
  end
end
