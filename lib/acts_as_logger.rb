require "acts_as_logger/logger"
require "acts_as_logger/log"

#FIXME - mudar para arquivo separado ou exigir que o usuario faça manualmente?
class ApplicationController < ActionController::Base
  before_filter :set_current_user

  private
  def set_current_user
    User.current = current_user
  end
end