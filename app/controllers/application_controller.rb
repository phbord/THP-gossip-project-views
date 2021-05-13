class ApplicationController < ActionController::Base
    include SessionsHelper
    include LikesHelper

    add_flash_types :info, :error, :warning
end
